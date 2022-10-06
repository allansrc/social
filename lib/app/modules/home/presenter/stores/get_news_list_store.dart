import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:social_boticario/app/core/modules/storage/presenter/interfaces/storage_controller.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/domain/usecases/get_news_list_usecase.dart';
import 'package:social_boticario/app/modules/home/presenter/states/get_news_list_state.dart';

class GetNewsListStore extends StreamStore<NewsListDatasourceError, GetNewsListState> with HydratedMixin {
  GetNewsListStore(
    this._getNewsList,
    this._storageController,
  ) : super(GetNewsListState(NewsListResponse()));

  final IGetNewsList _getNewsList;

  final IStorageController _storageController;

  // Implement this
  // final AuthStore _authStore;

  @override
  String get keyName => '$runtimeType${'-user-'}';

  Future<void> getNewsList() async {
    debugPrint('started store');
    setLoading(true);

    var result = await _getNewsList();

    result.fold(onFailure: (failure) {
      update(state, force: true);
      setLoading(false);
    }, onSuccess: (succes) {
      update(state.copyWith(
        newsListResponse: NewsListResponse(newsList: succes.newsList),
        paginationLock: false,
      ));
      setLoading(false);
    });
  }
}
