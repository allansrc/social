import 'package:social_boticario/app/modules/home/domain/entities/news_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';

class HomeState {
  final List<NewsEntity> newsList;
  final List<PostEntity> postList;

  HomeState(this.newsList, this.postList);

  HomeState copyWith({
    List<NewsEntity>? newsList,
    List<PostEntity>? postList,
  }) {
    return HomeState(
      newsList ?? this.newsList,
      postList ?? this.postList,
    );
  }
}
