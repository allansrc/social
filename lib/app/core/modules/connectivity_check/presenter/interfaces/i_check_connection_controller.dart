import '../../domain/entities/connection_entity.dart';

abstract class ICheckConnectionController {
  Future<bool> checkConnection();
  Future<Stream<ConnectionEntity>> listenConnection();
  Future<ConnectionEntity> checkConnectionType();
}
