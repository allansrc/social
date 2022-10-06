import '../../domain/entities/request_entity.dart';

abstract class IQueueRequestController {
  Future<bool> saveRequest(RequestEntity request);
  Future<bool> syncRequest(int userId);
}
