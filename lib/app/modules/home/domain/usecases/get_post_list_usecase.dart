import 'package:social_boticario/app/core/utils/custom/either.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/domain/repositories/i_get_post_list_repository.dart';

abstract class IGetPostList {
  Future<CustomEither<INewsFailure, PostListResponse>> call();
}

class GetPostList implements IGetPostList {
  final IGetPostListRepository _repository;

  GetPostList(this._repository);

  @override
  Future<CustomEither<INewsFailure, PostListResponse>> call() async {
    return await _repository();
  }
}
