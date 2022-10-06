import 'package:social_boticario/app/core/utils/custom/either.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/domain/repositories/i_get_news_list_repository.dart';

abstract class IGetNewsList {
  Future<CustomEither<INewsFailure, NewsListResponse>> call();
}

class GetNewsList implements IGetNewsList {
  final IGetNewsListRepository _repository;

  GetNewsList(this._repository);

  @override
  Future<CustomEither<INewsFailure, NewsListResponse>> call() async {
    return await _repository();
  }
}
