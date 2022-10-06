import 'package:social_boticario/app/core/utils/custom/either.dart';
import '../entities/connection_entity.dart';
import '../errors/errors.dart';
import '../services/connectivity_service.dart';

abstract class ICheckConnectionType {
  Future<CustomEither<IConnectionFailure, ConnectionEntity>> call();
}

class CheckConnectionType implements ICheckConnectionType {
  final IConnectivityService _service;

  CheckConnectionType(this._service);
  @override
  Future<CustomEither<IConnectionFailure, ConnectionEntity>> call() {
    return _service.checkConnectionType();
  }
}
