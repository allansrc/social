import 'package:social_boticario/app/core/utils/custom/either.dart';
import '../entities/request_entity.dart';
import '../errors/erros.dart';
import '../repositories/i_save_request_repository.dart';

abstract class ISaveRequest {
  Future<CustomEither<IFailureQueueRequest, bool>> call(RequestEntity request);
}

class SaveRequest implements ISaveRequest {
  final ISaveRequestRepository _repository;

  SaveRequest(this._repository);
  @override
  Future<CustomEither<IFailureQueueRequest, bool>> call(RequestEntity request) {
    return _repository.saveRequest(request);
  }
}
