import 'package:vaultiq/src/core/domain/entities/domain_object.dart';

final class ProfileModel extends DomainObject {
  final String? id;
  final String? userName;
  final String? fullName;
  final String? avatarUrl;
  final String? email;
  final DateTime? updatedAt;
  final DateTime? dateOfBirth;
  @override
  List<Object?> get props => [
        id,
        userName,
        fullName,
        avatarUrl,
        email,
        updatedAt,
        dateOfBirth,
      ];

  const ProfileModel({
    this.id,
    this.userName,
    this.fullName,
    this.avatarUrl,
    this.email,
    this.updatedAt,
    this.dateOfBirth,
  });

  @override
  ProfileModel copyWith() {
    return ProfileModel(
      id: id,
      userName: userName,
      fullName: fullName,
      avatarUrl: avatarUrl,
      email: email,
      updatedAt: updatedAt,
      dateOfBirth: dateOfBirth,
    );
  }
}
