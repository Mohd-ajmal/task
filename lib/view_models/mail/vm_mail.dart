import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:task/database/model/email_model.dart';
import 'package:task/database/mail_db.dart';

class MailViewModal extends ChangeNotifier {
  // ---------------------------------- getters --------------------------------

  List<MailTable> get value => _value;
  // ---------------------------------- variables ------------------------------
  List<MailTable> _localList = [];
  List<MailTable> _value = [];

  // ---------------------------------- methods --------------------------------
  Future onGetMailStatusDetails() async {
    _localList = await MailDb.instance.readAllEmployee() ?? [];
    if (_localList.isEmpty) {
      for (int i = 1; i <= 5; i++) {
        switch (i) {
          case 1:
            {
              await MailDb.instance.create(MailTable(
                  id: 1,
                  desc: "UpdateTask",
                  status: "Success",
                  dateTime: "3-10-2022 10:0"));
            }
            break;
          case 2:
            {
              await MailDb.instance.create(MailTable(
                  id: 2,
                  desc: "UpdateStatus",
                  status: "Pending",
                  dateTime: "3-10-2022 11:0"));
            }
            break;
          case 3:
            {
              await MailDb.instance.create(MailTable(
                  id: 3,
                  desc: "UpdatePerson",
                  status: "Error",
                  dateTime: "3-10-2022 11:2"));
            }
            break;
          case 4:
            {
              await MailDb.instance.create(MailTable(
                  id: 4,
                  desc: "UpdateTask",
                  status: "Success",
                  dateTime: "4-10-2022 10:0"));
            }
            break;
          case 5:
            {
              await MailDb.instance.create(MailTable(
                  id: 5,
                  desc: "UpdateStatus",
                  status: "Pending",
                  dateTime: "4-10-2022 11:0"));
            }
            break;
        }
      }
      _localList = await MailDb.instance.readAllEmployee() ?? [];

      for (int i = 0; i < 5; i++) {
        _value.add(MailTable(
            id: _localList[i].id,
            desc: _localList[i].desc,
            status: _localList[i].status,
            dateTime: _localList[i].dateTime));
      }
      log(_value[1].dateTime);
      notifyListeners();
    } else {
      log(_localList[1].dateTime);

      for (int i = 0; i < _localList.length; i++) {
        _value.add(MailTable(
            id: _localList[i].id,
            desc: _localList[i].desc,
            status: _localList[i].status,
            dateTime: _localList[i].dateTime));
      }
      notifyListeners();
    }
  }

  delete() {
    MailDb.instance.delete();
  }
}
