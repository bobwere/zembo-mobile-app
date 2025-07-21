import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zembo_agent_app/domain/country/country.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'country') Country? country,
    @JsonKey(name: 'device_token') String? deviceToken,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.initial() => User();
}
