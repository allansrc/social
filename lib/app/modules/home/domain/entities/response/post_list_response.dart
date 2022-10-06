import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';

class PostListResponse {
  // @override
  List<PostEntity> postList;
  PostListResponse({
    this.postList = const [],
  });

  PostListResponse copyWith({
    List<PostEntity>? postList,
  }) {
    return PostListResponse(
      postList: postList ?? this.postList,
    );
  }
}

abstract class IPostListResponse {
  List<PostEntity> postList;
  IPostListResponse({
    this.postList = const [],
  });
}
