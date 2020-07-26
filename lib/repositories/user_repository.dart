import 'package:http/http.dart' as http;
import 'package:todo_flutter_sample/config/app_config.dart';

class UserRepository {
  String headerAuthorization;

  Future<http.Response> getMe() {
    final appConfig = AppConfig();
    final url = appConfig.envConfig.oauth2UserInfoUrl;
    return http.get(url, headers: {'Authorization': headerAuthorization});
  }
}
