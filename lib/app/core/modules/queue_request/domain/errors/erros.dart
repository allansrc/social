abstract class IFailureQueueRequest implements Exception {
  final String? message;

  IFailureQueueRequest(this.message);
}

class SaveRequestError implements IFailureQueueRequest {
  @override
  final String? message;
  SaveRequestError({this.message});
}

class SyncRequestError implements IFailureQueueRequest {
  @override
  final String? message;
  SyncRequestError({this.message});
}

class GetRequestListError implements IFailureQueueRequest {
  @override
  final String? message;
  GetRequestListError({this.message});
}
