import 'package:social_boticario/app/core/contracts/i_mapper.dart';
import 'package:social_boticario/app/modules/home/domain/entities/news_entity.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/external/mappers/message_entity_mapper.dart';
import 'package:social_boticario/app/modules/home/external/mappers/user_entity_mapper.dart';

class NewsEntityMapper implements IMapper {
  @override
  Future<void> checkJson(Map<dynamic, dynamic> json) async {
    final jsonKeys = ['user', 'message'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future fromMap(Map<dynamic, dynamic> json) async {
    try {
      final user = await UserEntityMapper().fromMap(json['user']);
      final message = await MessageEntityMapper().fromMap(json['message']);
      return NewsEntity(
        user: user,
        message: message,
      );
    } catch (e) {
      throw MapperError(message: 'Erro de serialização > NewsEntityMapper');
    }
  }

  @override
  Map toMap(object) {
    return {'user': object.user, 'message': object.message};
  }

  @override
  fromMapSync(Map<String, dynamic> json) {
    // TODO: implement fromMapSync
    throw UnimplementedError();
  }
}
