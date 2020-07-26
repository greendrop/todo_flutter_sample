import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/helpers/oauth2_client.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/repositories/user_repository.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    OAuth2Token token,
    User user,
    @Default(false) bool isFetching,
    @Default(false) bool isUnauthorized,
    @Default(false) bool isError,
    @Default(0) int errorStatus,
    @Default('') String errorBody,
    @Default(false) bool isRefreshFetching,
  }) = _AuthState;
  factory AuthState.fromJson(Map<String, dynamic> json) {
    return _$AuthStateFromJson(json);
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());

  void setToken(OAuth2Token token) {
    state = state.copyWith(token: token);
  }

  void setUser(User user) {
    state = state.copyWith(user: user);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsFetching(bool isFetching) {
    state = state.copyWith(isFetching: isFetching);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsUnauthorized(bool isUnauthorized) {
    state = state.copyWith(isUnauthorized: isUnauthorized);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsError(bool isError) {
    state = state.copyWith(isError: isError);
  }

  void setErrorStatus(int errorStatus) {
    state = state.copyWith(errorStatus: errorStatus);
  }

  void setErrorBody(String errorBody) {
    state = state.copyWith(errorBody: errorBody);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsRefreshFetching(bool isRefreshFetching) {
    state = state.copyWith(isRefreshFetching: isRefreshFetching);
  }

  void clearToken() {
    setToken(null);
  }

  void clearUser() {
    setUser(null);
  }

  Future<bool> fetchTokenAndUserByCode(String code) async {
    final completer = Completer<bool>();
    var success = false;

    setIsFetching(true);
    setIsUnauthorized(false);
    setIsError(false);
    setErrorStatus(0);
    setErrorBody('');

    final oauth2Client = OAuth2Client();
    final accessTokenResponse = await oauth2Client.getAccessTokenByCode(code);

    if (accessTokenResponse.statusCode >= 200 &&
        accessTokenResponse.statusCode < 300) {
      final body =
          json.decode(accessTokenResponse.body) as Map<String, dynamic>;
      body['expires_at'] = DateTime.fromMicrosecondsSinceEpoch(
              ((body['created_at'] as int) + (body['expires_in'] as int)) *
                  1000000)
          .toIso8601String();
      body['created_at'] = DateTime.fromMicrosecondsSinceEpoch(
              (body['created_at'] as int) * 1000000)
          .toIso8601String();
      final fetchedToken = OAuth2Token.fromJson(body);

      final userRepository = UserRepository()
        ..headerAuthorization = 'Bearer ${fetchedToken.accessToken}';

      final userResponse = await userRepository.getMe();

      if (userResponse.statusCode >= 200 && userResponse.statusCode < 300) {
        final body = json.decode(userResponse.body) as Map<String, dynamic>;
        setToken(fetchedToken);
        setUser(User.fromJson(body));
        success = true;
      } else {
        setIsError(true);
        setErrorStatus(userResponse.statusCode);
        setErrorBody(userResponse.body);
        if (userResponse.statusCode == 401) {
          setIsUnauthorized(true);
        }
      }
    } else {
      setIsError(true);
      setErrorStatus(accessTokenResponse.statusCode);
      setErrorBody(accessTokenResponse.body);
      if (accessTokenResponse.statusCode == 401) {
        setIsUnauthorized(true);
      }
    }
    setIsFetching(false);
    completer.complete(success);
    return completer.future;
  }

  Future<void> fetchTokenByRefreshToken(String refreshToken) async {
    if (state.isRefreshFetching) {
      return;
    }

    setIsRefreshFetching(true);
    setIsError(false);
    setErrorStatus(0);
    setErrorBody('');

    final oauth2Client = OAuth2Client();
    final response =
        await oauth2Client.getAccessTokenByRefreshToken(refreshToken);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      body['expires_at'] = DateTime.fromMicrosecondsSinceEpoch(
              ((body['created_at'] as int) + (body['expires_in'] as int)) *
                  1000000)
          .toIso8601String();
      body['created_at'] = DateTime.fromMicrosecondsSinceEpoch(
              (body['created_at'] as int) * 1000000)
          .toIso8601String();
      final fetchedToken = OAuth2Token.fromJson(body);
      setToken(fetchedToken);
    } else {
      setIsError(true);
      setErrorStatus(response.statusCode);
      setErrorBody(response.body);
      if (response.statusCode == 401) {
        setIsUnauthorized(true);
      }
    }
  }

  void signOut() {
    clearToken();
    clearUser();
    setIsUnauthorized(false);
  }
}
