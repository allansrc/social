import 'package:social_boticario/app/core/contracts/i_mapper.dart';
import 'package:social_boticario/app/modules/home/domain/entities/post_entity.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/external/mappers/user_entity_mapper.dart';

class PostEntityMapper implements IMapper {
  @override
  Future<void> checkJson(Map<dynamic, dynamic> json) async {
    final jsonKeys = ['user', 'post'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future fromMap(Map<dynamic, dynamic> json) async {
    try {
      final user = await json['user']['name'];
      final message = json['post'];
      return PostEntity(
        user: user,
        post: message,
        urlAvatar: '',
        uuid: '',
      );
    } catch (e) {
      throw MapperError(message: 'Erro de serialização > PostEntityMapper');
    }
  }

  @override
  Map toMap(object) {
    return {'user': object.user, 'post': object.post};
  }

  @override
  fromMapSync(Map<String, dynamic> json) {
    // TODO: implement fromMapSync
    throw UnimplementedError();
  }
}
