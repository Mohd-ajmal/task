import 'package:flutter/foundation.dart';

class EmailModel {
  String name;
  String email;
  String subject;
  String message;

  EmailModel(
      {required this.name,
      required this.email,
      required this.subject,
      required this.message});
}
