import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:social_boticario/app/core/modules/storage/presenter/interfaces/storage_controller.dart';
import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/domain/usecases/get_post_list_usecase.dart';
import 'package:social_boticario/app/modules/home/presenter/states/get_posts_list_state.dart';

class GetPostListStore extends StreamStore<NewsListDatasourceError, GetPostListState> with HydratedMixin {
  GetPostListStore(
    this._getPostList,
    this._storageController,
  ) : super(GetPostListState(PostListResponse()));

  final IGetPostList _getPostList;

  final IStorageController _storageController;

  // Implement this
  // final AuthStore _authStore;

  @override
  String get keyName => '$runtimeType${'-user-'}';

  Future<void> getPostList() async {
    debugPrint('started store');
    setLoading(true);

    var result = await _getPostList();

    result.fold(onFailure: (failure) {
      update(state, force: true);
      setLoading(false);
    }, onSuccess: (succes) {
      update(state.copyWith(
        postListResponse: PostListResponse(postList: succes.postList),
        paginationLock: false,
      ));
      setLoading(false);
    });
  }

  Future<void> setPostToList(PostEntity entity) async {
    debugPrint('started store');
    setLoading(true);

    List<PostEntity> tempList = [entity, ...state.postListResponse.postList];

    update(state.copyWith(
      postListResponse: PostListResponse(postList: tempList),
      paginationLock: false,
    ));
    setLoading(false);
  }
}
