import 'package:social_boticario/app/core/utils/custom/either.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/domain/repositories/i_get_news_list_repository.dart';
import 'package:social_boticario/app/modules/home/infra/datasources/i_get_news_list_datasource.dart';

class GetNewsListRepository implements IGetNewsListRepository {
  final IGetNewsListDatasource _datasource;

  /// ToDo Implementations
  // final IStorageController _storageController;
  // final ICheckConnectionController _checkConnectionController;

  GetNewsListRepository(
    this._datasource,
    // this._storageController,
    // this._checkConnectionController,
  );

  @override
  Future<CustomEither<INewsFailure, NewsListResponse>> call() async {
    /// ToDo Implementations
    // if (!(await _checkConnectionController.checkConnection())) {
    //   return FailureResponse(IGetNewsListDatasourceError(message: 'Sem conexão'));
    // }
    try {
      return SuccessResponse(await _datasource.getNewsList());
    } on INewsFailure catch (e) {
      return FailureResponse(NewsListDatasourceError(message: '${e.message}'));
    }
  }
}
