import 'package:json_annotation/json_annotation.dart';
import 'package:todo_flutter_sample/models/user.dart';

part 'oauth2_token.g.dart';

@JsonSerializable()
class OAuth2Token {
  OAuth2Token();

  factory OAuth2Token.fromJson(Map<String, dynamic> json) =>
      _$OAuth2TokenFromJson(json);
  Map<String, dynamic> toJson() => _$OAuth2TokenToJson(this);

  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'refresh_token')
  String refreshToken;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'expires_at')
  DateTime expiresAt;

  bool isValidToken() {
    return (accessToken ?? '') != '' &&
        expiresAt != null &&
        expiresAt.isAfter(DateTime.now());
  }

  bool isSignedIn(User user) {
    return isValidToken() && (user?.id ?? 0) != 0;
  }

  bool isNeedRefresh() {
    if ((refreshToken ?? '') == '' || expiresAt == null) {
      return false;
    }

    return expiresAt.isAfter(DateTime.now().add(const Duration(hours: -1)));
  }
}
