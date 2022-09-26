import 'dart:async';
import 'dart:io';

import 'package:task/models/model_github.dart';
import 'package:task/service/http_service.dart';

class GitHubRepository {
  static Future<List<Item>?> getRepositoryResponse({required page}) async {
    try {
      var response = await HttpService.getRepoResponse(page: page);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        var result = githubReposFromJson(response.body);
        return result.items;
      } else {
        return null;
      }
    } on SocketException {
      rethrow;
    } on FormatException {
      rethrow;
    } on HttpException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}
