import 'package:social_boticario/app/core/utils/custom/either.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';

abstract class IGetPostListRepository {
  Future<CustomEither<INewsFailure, PostListResponse>> call();
}
