import 'package:json_annotation/json_annotation.dart';
import 'package:todo_flutter_sample/models/user.dart';

part 'oauth2_token.g.dart';

@JsonSerializable()
class OAuth2Token {
  OAuth2Token();

  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'refresh_token')
  String refreshToken;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'expires_at')
  DateTime expiresAt;

  // ignore: sort_constructors_first
  factory OAuth2Token.fromJson(Map<String, dynamic> json) =>
      _$OAuth2TokenFromJson(json);
  Map<String, dynamic> toJson() => _$OAuth2TokenToJson(this);

  bool isValidToken() {
    return accessToken != '' &&
        expiresAt != null &&
        expiresAt.compareTo(DateTime.now()) >= 0;
  }

  bool isSignedIn(User user) {
    return isValidToken() && user != null && user.id != 0;
  }

  bool isNeedRefresh() {
    if (expiresAt == null) {
      return false;
    }

    final date = expiresAt.add(const Duration(hours: -1));
    return date.compareTo(DateTime.now()) < 0;
  }
}
