import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/presenter/stores/get_news_list_store.dart';
import 'package:social_boticario/app/modules/home/presenter/stores/get_posts_list_store.dart';

import 'states/home_state.dart';

class HomeController extends StreamStore<NewsListDatasourceError, HomeState> {
  HomeController(
    this.getNewsListStore,
    this.getPostStore,
  ) : super(HomeState([], []));

  final GetNewsListStore getNewsListStore;
  final GetPostListStore getPostStore;
  // final SendPostStore _sendPostStore; // TODO implementation

  Future<void> getNewsList() async {
    debugPrint('started Controller');
    setLoading(true);
    await getNewsListStore.getNewsList();
    update(state.copyWith(newsList: getNewsListStore.state.newsListResponse.newsList));
    setLoading(false);
  }

  Future<void> getPostList() async {
    debugPrint('started Controller');
    setLoading(true);
    await getPostStore.getPostList();
    update(state.copyWith(postList: getPostStore.state.postListResponse.postList));
    setLoading(false);
  }

  Future<void> setPostToList(String postMessage) async {
    setLoading(true);
    final post = PostEntity(user: 'Me', uuid: 'uuid', post: postMessage, urlAvatar: '');
    await getPostStore.setPostToList(post);
    update(state.copyWith(postList: getPostStore.state.postListResponse.postList));
    setLoading(false);
  }
}
