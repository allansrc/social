import 'package:dio/dio.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/external/mappers/news_list_response_mapper.dart';
import 'package:social_boticario/app/modules/home/infra/datasources/i_get_news_list_datasource.dart';

import '../../../../core/shared/enviroment/enviroment_variables.dart';

class GetNewsListDatasource extends IGetNewsListDatasource {
  final Dio _httpClient;

  GetNewsListDatasource(this._httpClient);

  @override
  Future<NewsListResponse> getNewsList() async {
    var entity = NewsListResponse(newsList: []);
    NewsListResponse listResponse;

    try {
      final response = await _httpClient.get(EnviromentVariables().urlDomain);

      listResponse = await NewsListReponseMapper().fromMap(response.data);

      entity = entity.copyWith(newsList: [...entity.newsList, ...listResponse.newsList]);

      return entity;
    } on DioError catch (e) {
      if (e.response != null) {
        throw DatasourceError(message: '${e.response?.data['message']}');
      }
      if (e.error == null) {
        throw DatasourceError(message: 'Falha na conexão');
      }
      throw DatasourceError(message: 'Falha na conexão');
    } catch (e) {
      throw DatasourceError(message: 'Erro: ${e.toString()}');
    }
  }
}
