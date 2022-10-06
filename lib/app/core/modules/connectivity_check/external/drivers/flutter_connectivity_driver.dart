import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/entities/connection_entity.dart';
import '../../domain/errors/errors.dart';
import '../../infra/drivers/connectivity_driver.dart';

class FlutterConnectivityDriver implements IConnectivityDriver {
  final Connectivity connectivity;

  FlutterConnectivityDriver(this.connectivity);
  @override
  Future<bool> get isOnline async {
    try {
      var result = await connectivity.checkConnectivity();
      return result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile;
    } catch (e) {
      throw ConnectionError('no connection');
    }
  }

  @override
  Future<Stream<ConnectionEntity>> listenConnection() async {
    try {
      var result = await connectivity.onConnectivityChanged;
      return ConnectionStream(result);
    } catch (e) {
      throw ConnectionError('no connection');
    }
  }

  @override
  Future<ConnectionEntity> checkConnectionType() async {
    try {
      var result = await connectivity.checkConnectivity();
      return ConnectionEntity(
      hasMobile: result == ConnectivityResult.mobile,
      hasWifi: result == ConnectivityResult.wifi,
      none: result == ConnectivityResult.none,
    );
    } catch (e) {
      throw ConnectionError('no connection');
    }
  }
}

class ConnectionStream extends Stream<ConnectionEntity>
    implements Sink<ConnectionEntity> {
  final Stream<ConnectivityResult> connectivityResult;
  final StreamController controller = StreamController<ConnectivityResult>();

  ConnectionStream(this.connectivityResult);
  @override
  void add(ConnectionEntity data) {
    controller.add(connectivityResult);
  }

  @override
  void close() {
    controller.close();
  }

  @override
  StreamSubscription<ConnectionEntity> listen(void Function(ConnectionEntity event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return connectivityResult.map((event) => ConnectionEntity(
      hasMobile: event == ConnectivityResult.mobile,
      hasWifi: event == ConnectivityResult.wifi,
      none: event == ConnectivityResult.none,
    )).listen(onData, cancelOnError: cancelOnError, onDone: onDone, onError: onError);
  }

}
