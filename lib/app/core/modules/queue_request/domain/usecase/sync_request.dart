import 'package:social_boticario/app/core/utils/custom/either.dart';
import '../../../connectivity_check/presenter/interfaces/i_check_connection_controller.dart';
import '../entities/request_entity.dart';
import '../errors/erros.dart';
import '../repositories/i_get_request_list_repository.dart';
import '../repositories/i_sync_request_repository.dart';

abstract class ISyncRequest {
  Future<CustomEither<IFailureQueueRequest, bool>> call(int userId);
}

class SyncRequest implements ISyncRequest {
  final ISyncRequestRepository _repository;
  final IGetRequestListRequestRepository _getRequestListRequestRepository;
  final ICheckConnectionController _checkConnectionController;

  SyncRequest(this._repository, this._getRequestListRequestRepository, this._checkConnectionController);

  @override
  Future<CustomEither<IFailureQueueRequest, bool>> call(int userId) async {
    if (!(await _checkConnectionController.checkConnection())) {
      return FailureResponse(SyncRequestError(message: 'no_connection'));
    }

    var listRequest = await getRequestList(userId);

    for (var item in listRequest) {
      await _repository.syncRequest(item);
    }

    return SuccessResponse(true);
  }

  Future<List<RequestEntity>> getRequestList(int userId) async {
    var result = await _getRequestListRequestRepository.getRequestListRequest(userId);
    return result.fold(onSuccess: (r) => r, onFailure: (l) => []);
  }
}
