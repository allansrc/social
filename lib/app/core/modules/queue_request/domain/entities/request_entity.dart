// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

class RequestEntity {
  final String uri;
  final dynamic data;
  final String? contentType;
  final Map<String, dynamic>? extra;
  final String? method;
  final Map<String, dynamic>? headers;
  final int userId;
  final int? hashCodeRequest;

  RequestEntity({
    required this.uri,
    this.data,
    this.contentType,
    this.extra,
    this.method,
    this.headers,
    this.hashCodeRequest,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uri': uri,
      'data': data,
      'contentType': contentType,
      'extra': extra,
      'method': method,
      'headers': headers,
      'userId': userId,
      'hashCodeRequest': hashCodeRequest,
    };
  }

  factory RequestEntity.fromMap(Map? map) {
    return RequestEntity(
      uri: map?['uri'] ?? '',
      data: map?['data'] ?? null,
      contentType: map?['contentType'],
      extra: Map.from(map?['extra'] ?? {}),
      method: map?['method'],
      userId: map?['userId'],
      hashCodeRequest: map?['hashCodeRequest'],
      headers: Map.from(map?['headers'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestEntity.fromJson(String source) => RequestEntity.fromMap(json.decode(source));
}
