import '../../domain/entities/connection_entity.dart';

abstract class IConnectivityDriver {
  Future<Stream<ConnectionEntity>> listenConnection();
  Future<ConnectionEntity> checkConnectionType();
  Future<bool> get isOnline;
}