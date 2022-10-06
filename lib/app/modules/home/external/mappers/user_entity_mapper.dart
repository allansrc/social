import 'package:flutter/foundation.dart';
import 'package:social_boticario/app/core/contracts/i_mapper.dart';
import 'package:social_boticario/app/modules/home/domain/entities/user_entity.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';

class UserEntityMapper implements IMapper {
  @override
  Future<void> checkJson(Map<dynamic, dynamic> json) async {
    final jsonKeys = ['name', 'profile_avatar'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        // Implements Mapper Error
        // throw MapperErrorActivityError(message: '$key Não encontrada');
        debugPrint('$key Não encontrada');
        throw MapperError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future fromMap(Map<dynamic, dynamic> json) async {
    try {
      return UserEntity(
        uuid: json['uuid'] ?? '-1',
        name: json['name'] ?? '',
        profilePicture: json['profile_picture'] ?? '',
      );
    } catch (e) {
      throw MapperError(message: 'Erro de serialização > UserEntityMapper');
    }
  }

  @override
  Map toMap(object) {
    return {'name': object.name, 'profile_picture': object.profilePicture};
  }

  @override
  fromMapSync(Map<String, dynamic> json) {
    // TODO: implement fromMapSync
    throw UnimplementedError();
  }
}
