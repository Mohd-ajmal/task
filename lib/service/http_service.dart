import 'package:http/http.dart' as http;
import 'package:task/constants/api_manager.dart';

class HttpService {
  static Future<http.Response> getRepoResponse({required page}) async {
    http.Response response;
    var url = Uri.parse(ApiManager.gitHubEndPoint + page);
    try {
      response = await http.get(url);
    } catch (e) {
      rethrow;
    }
    return response;
  }

  //
  static Future<http.Response> getEmpResponse() async {
    http.Response response;
    var url = Uri.parse(ApiManager.empDetailsEndPoint);
    try {
      response = await http.get(url);
    } catch (e) {
      rethrow;
    }
    return response;
  }
}
