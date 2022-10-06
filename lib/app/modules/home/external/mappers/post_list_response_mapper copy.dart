import 'package:flutter/foundation.dart';
import 'package:social_boticario/app/core/contracts/i_mapper.dart';
import 'package:social_boticario/app/modules/home/domain/entities/news_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/news_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/entities/response/post_list_response.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/external/mappers/news_entity_mapper.dart';

import 'post_entity_mapper.dart';

class PostListReponseMapper implements IMapper {
  @override
  Future<void> checkJson(Map<dynamic, dynamic> json) async {
    final jsonKeys = ['user', 'message'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        // Implements Mapper Error
        // throw MapperErrorActivityError(message: '$key Não encontrada');
        debugPrint('$key Não encontrada');
      }
    }
  }

  @override
  Future fromMap(Map<dynamic, dynamic> json) async {
    try {
      var list = <PostEntity>[];

      for (var item in json['posts']) {
        list.add(await PostEntityMapper().fromMap(item));
      }

      return PostListResponse(postList: list);
    } catch (e) {
      throw MapperError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) {
    return {'news': object};
  }

  @override
  fromMapSync(Map<String, dynamic> json) {
    // TODO: implement fromMapSync
    throw UnimplementedError();
  }
}
