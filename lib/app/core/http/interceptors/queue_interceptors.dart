import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/connectivity_check/presenter/check_connection_controller.dart';

class QueueInterceptors extends Interceptor {
  final Dio dio = Dio();
  // final AuthStore authStore = Modular.get<AuthStore>();
  // final StorageController storageController = Modular.get<StorageController>();
  final CheckConnectionController checkConnection = Modular.get<CheckConnectionController>();

  var keyRequests = '';
  List listRequests = [];

  QueueInterceptors();

  Future<void> init() async {
    // TODO(allansrc): implements this
    // keyRequests = 'USER-${'${authStore.userLogged.user}'}-REQUESTS-LIST-KEY';
    // if (await storageController.containsKey(keyRequests)) {
    //   var map = await storageController.read(keyRequests);
    //   listRequests = map['list'];
    // }
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  var listRequestsRemove = [];
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await init();
    var hasConnection = await checkConnection.checkConnection();

    if (options.method == 'POST' && !hasConnection) {
      listRequests.add(RequestItem(
              uri: options.uri.toString(),
              contentType: options.contentType,
              data: options.data,
              extra: options.extra,
              headers: options.headers,
              method: options.method)
          .toMap());
      // TODO(allansrc): implements this
      // storageController.put(keyRequests, {'list': listRequests});
    }

    var hasSync = listRequests.isNotEmpty && hasConnection;
    // TODO(allansrc): implements this
    // && (authStore.userLogged.user?.email != null && authStore.userLogged.user!.email.isNotEmpty);

    if (hasSync) {
      try {
        for (var item in listRequests) {
          final options = RequestItem.fromMap(item);
          // TODO(allansrc): implements this
          // options.headers?['authorization'] = await authStore.token;
          try {
            await dio
                .request(options.uri,
                    data: options.data,
                    options: Options(
                      extra: options.extra,
                      method: options.method,
                      headers: options.headers,
                      contentType: options.contentType,
                    ))
                .then((value) {
              listRequestsRemove.add(item);
            });
          } on DioError catch (e) {
            if (e.error == 'Http status error [500]') {
              listRequestsRemove.add(item);
            }
            debugPrint(e.toString());
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    // TODO(allansrc): implements this
    // await storageController.put(keyRequests, {'list': listRequests..removeWhere((element) => listRequestsRemove.contains(element))});
    listRequestsRemove.clear();
    return super.onRequest(options, handler);
  }
}

class RequestItem {
  final String uri;
  final dynamic data;
  final String? contentType;
  final Map<String, dynamic>? extra;
  final String? method;
  final Map<String, dynamic>? headers;

  RequestItem({
    required this.uri,
    this.data,
    this.contentType,
    this.extra,
    this.method,
    this.headers,
  });

  Map<String, dynamic> toMap() {
    return {
      'uri': uri,
      'data': data,
      'contentType': contentType,
      'extra': extra,
      'method': method,
      'headers': headers,
    };
  }

  factory RequestItem.fromMap(Map map) {
    return RequestItem(
      uri: map['uri'],
      data: map['data'],
      contentType: map['contentType'],
      extra: Map<String, dynamic>.from(map['extra']),
      method: map['method'],
      headers: Map<String, dynamic>.from(map['headers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestItem.fromJson(String source) => RequestItem.fromMap(json.decode(source));
}
