import 'package:http/http.dart' as http;
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:uri/uri.dart';

class TaskRepository {
  TaskRepository() {
    _appConfig = AppConfig();
    _baseUrl = '${_appConfig.envConfig.apiBaseUrl}/v1/tasks';
  }

  AppConfig _appConfig;
  String _baseUrl;
  String headerAuthorization;

  Future<http.Response> getList(Map<String, String> queryParameters) {
    final uriBuilder = UriBuilder.fromUri(Uri.parse(_baseUrl))
      ..queryParameters = queryParameters;
    final url = uriBuilder.toString();
    return http.get(url, headers: {'Authorization': headerAuthorization});
  }

  Future<http.Response> get(int id) {
    final url = '$_baseUrl/${id.toString()}';
    return http.get(url, headers: {'Authorization': headerAuthorization});
  }
}
