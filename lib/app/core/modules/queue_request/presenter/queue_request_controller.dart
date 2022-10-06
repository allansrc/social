import 'dart:async';

import '../domain/entities/request_entity.dart';
import '../domain/usecase/save_request.dart';
import '../domain/usecase/sync_request.dart';
import 'interfaces/i_queue_request_controller.dart';

class QueueRequestController implements IQueueRequestController {
  QueueRequestController(this._syncRequest, this._saveRequest);
  final ISyncRequest _syncRequest;

  final ISaveRequest _saveRequest;

  @override
  Future<bool> saveRequest(RequestEntity request) async {
    var result = await _saveRequest(request);
    return result.fold(
        onFailure: (l) {
          return false;
        },
        onSuccess: (r) => r);
  }

  @override
  Future<bool> syncRequest(int userId) async {
    var result = await _syncRequest(userId);
    return result.fold(
        onFailure: (l) {
          return false;
        },
        onSuccess: (r) => r);
  }
}
