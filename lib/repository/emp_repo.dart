import 'dart:async';
import 'dart:io';

import 'package:task/models/model_emp.dart';

import 'package:task/service/http_service.dart';

class EmpRepository {
  static Future<List<EmployeeDetails>?> getRepositoryResponse() async {
    try {
      var response = await HttpService.getEmpResponse();
      //print(response.statusCode);
      if (response.statusCode == 200) {
        var result = employeeDetailsFromJson(response.body);
        return result;
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
