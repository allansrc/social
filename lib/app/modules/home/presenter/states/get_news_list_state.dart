import 'package:flutter_triple/flutter_triple.dart';
import 'package:social_boticario/app/modules/home/domain/entities/news_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/external/mappers/news_entity_mapper.dart';
import 'package:social_boticario/app/modules/home/external/mappers/news_list_response_mapper.dart';

class GetNewsListState implements Serializable<GetNewsListState> {
  final NewsListResponse newsListResponse;
  final bool paginationLock;

  GetNewsListState(this.newsListResponse, {this.paginationLock = false});

  @override
  GetNewsListState fromMap(Map<String, dynamic> map) {
    var temp = asyncFromMap(map);
    return temp;
  }

  GetNewsListState asyncFromMap(Map<String, dynamic> map) {
    var tempNewsListFiltered = <NewsEntity>[];
    var temp = NewsListReponseMapper().fromMapSync(map);

    for (var item in map['news']) {
      tempNewsListFiltered.add(NewsEntityMapper().fromMapSync(item));
    }

    return GetNewsListState(
      temp,
      paginationLock: false,
    );
  }

  GetNewsListState copyWith({
    NewsListResponse? newsListResponse,
    List<NewsEntity>? newsListFiltered,
    bool? paginationLock,
  }) {
    return GetNewsListState(
      newsListResponse ?? this.newsListResponse,
      paginationLock: paginationLock ?? this.paginationLock,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    var tempnewsListResponseFiltered = [];

    for (var item in newsListResponse.newsList) {
      tempnewsListResponseFiltered.add(NewsEntityMapper().toMap(item));
    }

    return {'newsListResponse': tempnewsListResponseFiltered};
  }
}
