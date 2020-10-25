import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_sample/models/user.dart';

part 'oauth2_token.freezed.dart';
part 'oauth2_token.g.dart';

@freezed
abstract class OAuth2Token implements _$OAuth2Token {
  const factory OAuth2Token({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'expires_at') DateTime expiresAt,
  }) = _OAuth2Token;
  factory OAuth2Token.fromJson(Map<String, dynamic> json) {
    return _$OAuth2TokenFromJson(json);
  }
  const OAuth2Token._();

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
