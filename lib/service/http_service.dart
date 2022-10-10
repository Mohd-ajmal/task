import 'dart:convert';
import 'dart:developer';

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

  static Future<http.Response> getMailResponse(
      {required name,
      required email,
      required subject,
      required message}) async {
    log(email);
    http.Response response;
    var url = Uri.parse(ApiManager.mailEndPoint);
    try {
      response = await http.post(url,
          headers: {'Content-type': 'application/json'},
          body: json.encode({
            'service_id': 'service_cew0tod',
            'template_id': 'template_orhizye',
            'user_id': 'eWh4epym3oWF2kzQ_',
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_subject': subject,
              'user_message': message
            }
          }));
    } catch (e) {
      rethrow;
    }
    return response;
  }
}
