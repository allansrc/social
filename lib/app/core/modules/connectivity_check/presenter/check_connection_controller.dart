import 'dart:async';

import '../domain/entities/connection_entity.dart';
import '../domain/usecases/check_connection.dart';
import '../domain/usecases/check_connection_type.dart';
import '../domain/usecases/listen_connection_stream.dart';
import 'interfaces/i_check_connection_controller.dart';

class CheckConnectionController implements ICheckConnectionController {
  final ICheckConnection _checkConnection;
  final ICheckConnectionType _checkConnectionType;
  final IListenConnectionStream _listenConnectionStream;
  final StreamController<ConnectionEntity> streamController = StreamController();

  CheckConnectionController(this._checkConnection, this._listenConnectionStream, this._checkConnectionType);
  @override
  Future<bool> checkConnection() async {
    var result = await _checkConnection();
    return result.fold(onFailure: (l) => false, onSuccess: (r) => r);
  }

  @override
  Future<Stream<ConnectionEntity>> listenConnection() async {
    var result = await _listenConnectionStream();
    return result.fold(
        onFailure: (l) {
          streamController.add(ConnectionEntity(
            none: true
          ));
          return streamController.stream;
        },
        onSuccess: (r) => r);
  }

  @override
  Future<ConnectionEntity> checkConnectionType() async {
    var result = await _checkConnectionType();
    return result.fold(
        onFailure: (l) {
          return ConnectionEntity(
            none: true
          );
        },
        onSuccess: (r) => r);
  }
}
