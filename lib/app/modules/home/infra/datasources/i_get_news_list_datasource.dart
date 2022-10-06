import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';

abstract class IGetNewsListDatasource {
  Future<NewsListResponse> getNewsList();
}
