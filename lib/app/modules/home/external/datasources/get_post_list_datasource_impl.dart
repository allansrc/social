import 'package:dio/dio.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/external/mappers/news_list_response_mapper.dart';
import 'package:social_boticario/app/modules/home/external/mappers/post_list_response_mapper%20copy.dart';
import 'package:social_boticario/app/modules/home/infra/datasources/i_get_news_list_datasource.dart';
import 'package:social_boticario/app/modules/home/infra/datasources/i_get_post_list_datasource.dart';
import 'package:social_boticario/app/modules/home/internal/data_post.json.dart';

import '../../../../core/shared/enviroment/enviroment_variables.dart';

class GetPostListDatasource extends IGetPostListDatasource {
  final Dio _httpClient;

  GetPostListDatasource(this._httpClient);

  @override
  Future<PostListResponse> getPostList() async {
    var entity = PostListResponse(postList: []);
    PostListResponse listResponse;

    try {
      // TODO implementation
      // final response = await _httpClient.get(EnviromentVariables().urlDomain);
      final response = await Future.delayed(const Duration(seconds: 2)).then((value) {
        return mockPostList;
      });

      listResponse = await PostListReponseMapper().fromMap(response);

      entity = entity.copyWith(postList: [...entity.postList, ...listResponse.postList]);

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
