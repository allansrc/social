import 'package:flutter/foundation.dart';
import 'package:social_boticario/app/core/contracts/i_mapper.dart';
import 'package:social_boticario/app/modules/home/domain/entities/message_entity.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';

class MessageEntityMapper implements IMapper {
  @override
  Future<void> checkJson(Map<dynamic, dynamic> json) async {
    final jsonKeys = ['content', 'created_at'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        debugPrint('$key Não encontrada');
        throw MapperError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future fromMap(Map<dynamic, dynamic> json) async {
    try {
      return MessageEntity(
        content: json['content'] ?? '',
        createdAt: json['created_at'] == null ? DateTime.now() : DateTime.parse(json['created_at']),
      );
    } catch (e) {
      throw MapperError(message: 'Erro de serialização > MessageEntityMapper');
    }
  }

  @override
  Map toMap(object) {
    return {'content': object.content, 'created_at': object.createdAt};
  }

  @override
  fromMapSync(Map<String, dynamic> json) {
    // TODO: implement fromMapSync
    throw UnimplementedError();
  }
}
