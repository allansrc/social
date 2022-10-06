import 'package:social_boticario/app/core/utils/custom/either.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';

abstract class IGetNewsListRepository {
  Future<CustomEither<INewsFailure, NewsListResponse>> call();
}
