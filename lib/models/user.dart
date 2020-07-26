import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  // ignore: sort_constructors_first
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
