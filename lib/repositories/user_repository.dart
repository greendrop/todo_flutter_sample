import 'package:http/http.dart' as http;
import 'package:todo_flutter_sample/config/app_config.dart';

class UserRepository {
  UserRepository() {
    _appConfig = AppConfig();
  }

  AppConfig _appConfig;
  String headerAuthorization;

  Future<http.Response> getMe() {
    final url = _appConfig.envConfig.oauth2UserInfoUrl;
    return http.get(url, headers: {'Authorization': headerAuthorization});
  }
}
