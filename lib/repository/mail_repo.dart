import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:task/service/http_service.dart';

class MailRepository {
  static Future getRepositoryResponse(
      {required name, required message, required subject}) async {
    try {
      var response = await HttpService.getMailResponse(
          name: name,
          email: "mohdajmal6705@gmail.com",
          message: message,
          subject: subject);
      log(response.body);
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        return response.statusCode;
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
