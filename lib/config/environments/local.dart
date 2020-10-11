import 'package:todo_flutter_sample/config/app_config.dart';

class EnvConfigLocal implements EnvConfig {
  @override
  String env = 'local';
  @override
  bool displayEnv = true;
  @override
  String oauth2ClientId = '4d0C6xSO0NmWuweCKaQhQudRLnrN8HC9YF5r_Hfrsrk';
  @override
  String oauth2ClientSecret = 'Hd5UbDJ63eztGJgn79v8O8H2GjVS1hEI3fg0wdl7OVk';
  @override
  String oauth2AccessTokenUrl =
      'http://todo-api-rails-sample.dev.sysgreenplus.net/auth/oauth/token';
  @override
  String oauth2AuthorizationUrl =
      'http://todo-api-rails-sample.dev.sysgreenplus.net/auth/oauth/authorize';
  @override
  String oauth2RedirectUrl =
      'https://todo-api-rails-sample.dev.sysgreenplus.net/';
  @override
  String oauth2UserInfoUrl =
      'http://todo-api-rails-sample.dev.sysgreenplus.net/api/v1/me';
  @override
  String apiBaseUrl = 'http://todo-api-rails-sample.dev.sysgreenplus.net';
}
