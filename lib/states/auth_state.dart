import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
    @Default(false) bool isRefreshFetching,
  }) = _AuthState;
  factory AuthState.fromJson(Map<String, dynamic> json) {
    return _$AuthStateFromJson(json);
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> with LocatorMixin {
  AuthStateNotifier() : super(const AuthState());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    initializeToken();
    initializeUser();
  }

  Future<void> initializeToken() async {
    final token = await _prefs.then((prefs) {
      final tokenJson =
          json.decode(prefs.getString('authToken')) as Map<String, dynamic>;
      return OAuth2Token.fromJson(tokenJson);
    });
    state = state.copyWith(token: token);
  }

  Future<void> initializeUser() async {
    final user = await _prefs.then((prefs) {
      final userJson =
          json.decode(prefs.getString('authUser')) as Map<String, dynamic>;
      return User.fromJson(userJson);
    });
    state = state.copyWith(user: user);
  }

  Future<bool> setTokenToPrefs(OAuth2Token token) async {
    final prefs = await _prefs;
    return prefs.setString('authToken', json.encode(token.toJson()));
  }

  Future<bool> setUserToPrefs(User user) async {
    final prefs = await _prefs;
    return prefs.setString('authUser', json.encode(user.toJson()));
  }

  AuthState setToken(OAuth2Token token) {
    setTokenToPrefs(token);
    return state = state.copyWith(token: token);
  }

  AuthState setUser(User user) {
    setUserToPrefs(user);
    return state = state.copyWith(user: user);
  }

  // ignore: avoid_positional_boolean_parameters
  AuthState setIsFetching(bool isFetching) {
    return state = state.copyWith(isFetching: isFetching);
  }

  // ignore: avoid_positional_boolean_parameters
  AuthState setIsUnauthorized(bool isUnauthorized) {
    return state = state.copyWith(isUnauthorized: isUnauthorized);
  }

  // ignore: avoid_positional_boolean_parameters
  AuthState setIsError(bool isError) {
    return state = state.copyWith(isError: isError);
  }

  AuthState setErrorStatusCode(int errorStatusCode) {
    return state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  AuthState setErrorBody(String errorBody) {
    return state = state.copyWith(errorBody: errorBody);
  }

  // ignore: avoid_positional_boolean_parameters
  AuthState setIsRefreshFetching(bool isRefreshFetching) {
    return state = state.copyWith(isRefreshFetching: isRefreshFetching);
  }

  AuthState clear() {
    setToken(null);
    setUser(null);
    setIsFetching(false);
    setIsUnauthorized(false);
    setIsError(false);
    setErrorStatusCode(0);
    setErrorBody('');
    return state;
  }

  Future<AuthState> fetchTokenAndUserByCode(String code) async {
    final completer = Completer<AuthState>();

    setIsFetching(true);
    setIsUnauthorized(false);
    setIsError(false);
    setErrorStatusCode(0);
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
      } else {
        setIsError(true);
        setErrorStatusCode(userResponse.statusCode);
        setErrorBody(userResponse.body);
        if (userResponse.statusCode == 401) {
          setIsUnauthorized(true);
        }
      }
    } else {
      setIsError(true);
      setErrorStatusCode(accessTokenResponse.statusCode);
      setErrorBody(accessTokenResponse.body);
      if (accessTokenResponse.statusCode == 401) {
        setIsUnauthorized(true);
      }
    }
    setIsFetching(false);
    completer.complete(state);
    return completer.future;
  }

  Future<AuthState> fetchTokenByRefreshToken(String refreshToken) async {
    final completer = Completer<AuthState>();

    if (state.isRefreshFetching) {
      completer.complete(state);
      return completer.future;
    }

    setIsRefreshFetching(true);
    setIsError(false);
    setErrorStatusCode(0);
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
      setErrorStatusCode(response.statusCode);
      setErrorBody(response.body);
      if (response.statusCode == 401) {
        setIsUnauthorized(true);
      }
    }

    completer.complete(state);
    return completer.future;
  }

  AuthState signOut() {
    setToken(null);
    setUser(null);
    setIsUnauthorized(false);
    return state;
  }
}
