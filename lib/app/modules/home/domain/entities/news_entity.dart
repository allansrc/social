import 'package:social_boticario/app/modules/home/domain/entities/message_entity.dart';
import 'package:social_boticario/app/modules/home/domain/entities/user_entity.dart';

class NewsEntity {
  final UserEntity user;
  final MessageEntity message;

  NewsEntity({
    required this.user,
    required this.message,
  });

  NewsEntity copyWith({UserEntity? user, MessageEntity? message}) {
    return NewsEntity(
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }
}
