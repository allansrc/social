class PostEntity {
  final String user;
  final String uuid;
  final String post;
  final String urlAvatar;

  PostEntity({
    required this.user,
    required this.uuid,
    required this.post,
    required this.urlAvatar,
  });

  PostEntity copyWith({String? user, String? uuid, String? post, String? urlAvatar}) {
    return PostEntity(
      user: user ?? this.user,
      uuid: uuid ?? this.uuid,
      post: post ?? this.post,
      urlAvatar: urlAvatar ?? this.urlAvatar,
    );
  }
}
