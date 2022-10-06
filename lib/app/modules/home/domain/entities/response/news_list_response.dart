import 'package:social_boticario/app/modules/home/domain/entities/news_entity.dart';

class NewsListResponse {
  // @override
  List<NewsEntity> newsList;
  NewsListResponse({
    this.newsList = const [],
  });

  NewsListResponse copyWith({
    List<NewsEntity>? newsList,
  }) {
    return NewsListResponse(
      newsList: newsList ?? this.newsList,
    );
  }
}

abstract class INewsListResponse {
  List<NewsEntity> newsList;
  INewsListResponse({
    this.newsList = const [],
  });
}
