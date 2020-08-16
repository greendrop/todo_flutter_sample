import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:uri/uri.dart';

class OAuth2Client {
  OAuth2Client() {
    final appConfig = AppConfig();
    oauth2ClientId = appConfig.envConfig.oauth2ClientId;
    oauth2ClientSecret = appConfig.envConfig.oauth2ClientSecret;
    oauth2AccessTokenUrl = appConfig.envConfig.oauth2AccessTokenUrl;
    oauth2AuthorizationUrl = appConfig.envConfig.oauth2AuthorizationUrl;
    oauth2RedirectUrl = appConfig.envConfig.oauth2RedirectUrl;
    oauth2UserInfoUrl = appConfig.envConfig.oauth2UserInfoUrl;
  }

  BuildContext context;
  String oauth2ClientId;
  String oauth2ClientSecret;
  String oauth2AccessTokenUrl;
  String oauth2AuthorizationUrl;
  String oauth2RedirectUrl;
  String oauth2UserInfoUrl;

  String getAuthorizationUrl() {
    final uriBuilder = UriBuilder.fromUri(Uri.parse(oauth2AuthorizationUrl))
      ..queryParameters['protocol'] = 'oauth2'
      ..queryParameters['response_type'] = 'code'
      ..queryParameters['client_id'] = oauth2ClientId
      ..queryParameters['redirect_uri'] = oauth2RedirectUrl;
    return uriBuilder.toString();
  }

  bool isRedirectUrlWithCode(String url) {
    final parse = Uri.parse(url);
    if (url.startsWith(oauth2RedirectUrl) &&
        parse.queryParameters['code'] != null) {
      return true;
    }
    return false;
  }

  String getCodeFromUrl(String url) {
    return Uri.parse(url).queryParameters['code'];
  }

  Future<http.Response> getAccessTokenByCode(String code) {
    final params = {
      'grant_type': 'authorization_code',
      'code': code,
      'client_id': oauth2ClientId,
      'client_secret': oauth2ClientSecret,
      'redirect_uri': oauth2RedirectUrl,
    };
    return http.post(oauth2AccessTokenUrl, body: params);
  }

  Future<http.Response> getAccessTokenByUsernameAndPassword(
      String username, String password) {
    final params = {
      'grant_type': 'password',
      'username': username,
      'password': password,
      'client_id': oauth2ClientId,
      'client_secret': oauth2ClientSecret,
    };
    return http.post(oauth2AccessTokenUrl, body: params);
  }

  Future<http.Response> getAccessTokenByRefreshToken(String refreshToken) {
    final params = {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': oauth2ClientId,
      'client_secret': oauth2ClientSecret,
      'redirect_uri': oauth2RedirectUrl,
    };
    return http.post(oauth2AccessTokenUrl, body: params);
  }
}
