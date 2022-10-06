import 'package:social_boticario/app/core/utils/custom/either.dart';
import '../entities/request_entity.dart';
import '../errors/erros.dart';

abstract class ISaveRequestRepository {
  Future<CustomEither<IFailureQueueRequest, bool>> saveRequest(RequestEntity request);
}
