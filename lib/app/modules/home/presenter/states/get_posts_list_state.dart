import 'package:flutter_triple/flutter_triple.dart';
import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';
import 'package:social_boticario/app/modules/home/external/mappers/post_entity_mapper.dart';
import 'package:social_boticario/app/modules/home/external/mappers/post_list_response_mapper%20copy.dart';

class GetPostListState implements Serializable<GetPostListState> {
  final PostListResponse postListResponse;
  final bool paginationLock;

  GetPostListState(this.postListResponse, {this.paginationLock = false});

  @override
  GetPostListState fromMap(Map<String, dynamic> map) {
    var temp = asyncFromMap(map);
    return temp;
  }

  GetPostListState asyncFromMap(Map<String, dynamic> map) {
    var tempNewsListFiltered = <PostEntity>[];
    var temp = PostListReponseMapper().fromMapSync(map);

    for (var item in map['news']) {
      tempNewsListFiltered.add(PostEntityMapper().fromMapSync(item));
    }

    return GetPostListState(
      temp,
      paginationLock: false,
    );
  }

  GetPostListState copyWith({
    PostListResponse? postListResponse,
    List<PostEntity>? newsListFiltered,
    bool? paginationLock,
  }) {
    return GetPostListState(
      postListResponse ?? this.postListResponse,
      paginationLock: paginationLock ?? this.paginationLock,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    var temppostListResponseFiltered = [];

    for (var item in postListResponse.postList) {
      temppostListResponseFiltered.add(PostEntityMapper().toMap(item));
    }

    return {'postListResponse': temppostListResponseFiltered};
  }
}
