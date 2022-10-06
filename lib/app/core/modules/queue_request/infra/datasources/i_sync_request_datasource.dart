import '../../domain/entities/request_entity.dart';

abstract class ISyncRequestDatasource {
  Future<bool> syncRequest(RequestEntity request);
}