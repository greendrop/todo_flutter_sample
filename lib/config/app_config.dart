import 'package:flutter/material.dart';

class AppConfig {
  factory AppConfig() => _instance;
  AppConfig._internal();

  static final AppConfig _instance = AppConfig._internal();

  Color toastBackgroundColor = Colors.black;
  Color toastTextColor = Colors.white;
  EnvConfig envConfig;
}

abstract class EnvConfig {
  String env;
  bool displayEnv;
  String oauth2ClientId;
  String oauth2ClientSecret;
  String oauth2AccessTokenUrl;
  String oauth2AuthorizationUrl;
  String oauth2RedirectUrl;
  String oauth2UserInfoUrl;
  String apiBaseUrl;
}
