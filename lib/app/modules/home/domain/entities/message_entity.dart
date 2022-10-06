class MessageEntity {
  final String content;
  final DateTime createdAt;

  MessageEntity({
    required this.content,
    required this.createdAt,
  });

  MessageEntity copyWith({String? content, DateTime? createdAt}) {
    return MessageEntity(
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
