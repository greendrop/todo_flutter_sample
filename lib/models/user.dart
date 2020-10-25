import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
}
