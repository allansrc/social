import 'package:social_boticario/app/core/utils/custom/either.dart';

import '../errors/errors.dart';
import '../services/connectivity_service.dart';

abstract class ICheckConnection {
  Future<CustomEither<IConnectionFailure, bool>> call();
}

class CheckConnection implements ICheckConnection {
  final IConnectivityService _service;

  CheckConnection(this._service);
  @override
  Future<CustomEither<IConnectionFailure, bool>> call() async {
    return await _service.isOnline();
  }
}
