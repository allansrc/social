class UserEntity {
  final String name;
  final String uuid;
  final String profilePicture;

  UserEntity({
    required this.uuid,
    required this.name,
    required this.profilePicture,
  });

  UserEntity copyWith({String? name, String? uuid, String? profilePicture}) {
    return UserEntity(
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
