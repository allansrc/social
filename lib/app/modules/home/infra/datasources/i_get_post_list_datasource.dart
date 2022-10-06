import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';

abstract class IGetPostListDatasource {
  Future<PostListResponse> getPostList();
}
