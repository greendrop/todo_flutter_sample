import 'package:todo_flutter_sample/config/app_config.dart';

class EnvConfigProd implements EnvConfig {
  @override
  String env = 'prod';
  @override
  bool displayEnv = false;
  @override
  String oauth2ClientId = 'DMm8fycO6BrIXzfxp0TE5qc1NAqBIuYRcOcAK1mg-ME';
  @override
  String oauth2ClientSecret = 'l87sHB3rrXzZe7iRT00tfP5z2y2nzfOZG-Q-mqZRfcA';
  @override
  String oauth2AccessTokenUrl =
      'https://todo-api-rails-sample.dev.sysgreenplus.net/auth/oauth/token';
  @override
  String oauth2AuthorizationUrl =
      'https://todo-api-rails-sample.dev.sysgreenplus.net/auth/oauth/authorize';
  @override
  String oauth2RedirectUrl =
      'https://todo-api-rails-sample.dev.sysgreenplus.net/';
  @override
  String oauth2UserInfoUrl =
      'https://todo-api-rails-sample.dev.sysgreenplus.net/api/v1/me';
  @override
  String apiBaseUrl = 'https://todo-api-rails-sample.dev.sysgreenplus.net/api';
}
