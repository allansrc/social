import '../../../../utils/custom/either.dart';
import '../entities/connection_entity.dart';
import '../errors/errors.dart';

abstract class IConnectivityService {
  Future<CustomEither<IConnectionFailure, bool>> isOnline();
  Future<CustomEither<IConnectionFailure, Stream<ConnectionEntity>>> listenConnection();
  Future<CustomEither<IConnectionFailure, ConnectionEntity>> checkConnectionType();
}
