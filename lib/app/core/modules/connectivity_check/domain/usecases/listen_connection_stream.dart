import 'package:social_boticario/app/core/utils/custom/either.dart';
import '../entities/connection_entity.dart';
import '../errors/errors.dart';
import '../services/connectivity_service.dart';

abstract class IListenConnectionStream {
  Future<CustomEither<IConnectionFailure, Stream<ConnectionEntity>>> call();
}

class ListenConnectionStream implements IListenConnectionStream {
  final IConnectivityService _service;

  ListenConnectionStream(this._service);
  @override
  Future<CustomEither<IConnectionFailure, Stream<ConnectionEntity>>> call() {
    return _service.listenConnection();
  }
}
