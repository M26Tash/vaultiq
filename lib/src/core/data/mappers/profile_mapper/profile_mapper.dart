import 'package:vaultiq/src/core/data/mappers/base_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';

final class ProfileMapper implements BaseMapper<ProfileModel> {
  @override
  Map<String, dynamic> toJson(ProfileModel data) {
    return {
      _Fields.id: data.id,
      _Fields.userName: data.userName,
      _Fields.fullName: data.fullName,
      _Fields.avatarUrl: data.avatarUrl,
      _Fields.email: data.email,
      _Fields.updatedAt: data.updatedAt,
      _Fields.dateOfBirth: data.dateOfBirth,
    };
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json[_Fields.id],
      userName: json[_Fields.userName],
      fullName: json[_Fields.fullName],
      avatarUrl: json[_Fields.avatarUrl],
      email: json[_Fields.email],
      updatedAt: json[_Fields.updatedAt],
      dateOfBirth: json[_Fields.dateOfBirth],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String userName = 'username';
  static const String fullName = 'full_name';
  static const String avatarUrl = 'avatar_url';
  static const String email = 'email';
  static const String updatedAt = 'updated_at';
  static const String dateOfBirth = 'date_of_birth';
}
