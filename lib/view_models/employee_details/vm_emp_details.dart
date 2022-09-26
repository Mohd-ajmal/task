import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task/constants/api_manager.dart';
import 'package:task/constants/strings.dart';
import 'package:task/database/emp_db.dart';
import 'package:task/database/model/sqf_model.dart';
import 'package:task/models/model_emp.dart';
import 'package:task/repository/emp_repo.dart';

class VmEmployeeDetails extends ChangeNotifier {
  // ----------------------------------- Getters -------------------------------
  String get error => _error;
  List get images => _images;
  List get strings => _strings;
  List<EmployeeDetails> get values => _value;
  List<EmployeeDetails> get searchResult => _searchBackup;

  ScrollController get scrollController => _listViewController;
  TextEditingController get search => _searchTextField;

  // ---------------------------------- Variables ------------------------------

  String _error = '';
  String searchWord = '';
  int page = 1;
  bool isProgress = true;
  final List _images = [];
  final List _strings = [];
  List<Emp> _localList = [];
  late List<EmployeeDetails> _value;
  List<EmployeeDetails> _searchBackup = [];

  final _listViewController = ScrollController();
  final _searchTextField = TextEditingController();

  // --------------------------------- Methods ---------------------------------
  Future onGetDetails() async {
    try {
      _localList = await EmpDb.instance.readAllEmployee() ?? [];

      if (_localList.isEmpty) {
        var response = await EmpRepository.getRepositoryResponse();
        if (response == null) {
          _error = Strings.somethingWentWrong;
          log(ApiManager.empDetailsEndPoint + Strings.somethingWentWrong);
          notifyListeners();
        } else {
          log(ApiManager.empDetailsEndPoint + Strings.success);
          _value = response;
          isProgress = false;
          notifyListeners();
          log(Strings.gettingDataFromInternet);
          _searchBackup = _value;
          for (int i = 0; i < _value.length; i++) {
            await EmpDb.instance.create(Emp(
                id: values[i].id,
                name: values[i].name,
                username: values[i].username,
                email: values[i].email,
                profileImage: values[i].profileImage,
                phone: values[i].phone,
                website: values[i].website,
                street: values[i].address.street,
                suite: values[i].address.suite,
                city: values[i].address.city,
                zipcode: values[i].address.zipcode,
                lat: double.parse(values[i].address.geo.lat),
                lng: double.parse(values[i].address.geo.lng),
                companyName: values[i].company?.name,
                catchPhrase: values[i].company?.catchPhrase,
                bs: values[i].company?.bs));
          }
        }
      } else {
        _value = [];
        for (int i = 0; i < _localList.length; i++) {
          _value.add(EmployeeDetails(
              id: _localList[i].id,
              name: _localList[i].name,
              username: _localList[i].username,
              email: _localList[i].email,
              profileImage: _localList[i].profileImage,
              phone: _localList[i].phone,
              website: _localList[i].website,
              address: Address(
                  street: _localList[i].street,
                  suite: _localList[i].suite,
                  city: _localList[i].city,
                  zipcode: _localList[i].zipcode ?? Strings.notSpecified,
                  geo: Geo(
                      lat: _localList[i].lat.toString(),
                      lng: _localList[i].lng.toString())),
              company: Company(
                  name: _localList[i].companyName ?? Strings.notSpecified,
                  catchPhrase:
                      _localList[i].catchPhrase ?? Strings.notSpecified,
                  bs: _localList[i].bs ?? Strings.notSpecified)));
        }
        isProgress = false;
        _searchBackup = _value;
        notifyListeners();
      }
    } on Exception catch (e) {
      if (e is SocketException) {
        _localList = await EmpDb.instance.readAllEmployee() ?? [];
        if (_localList.isEmpty) {
          _error = Strings.checkYourInternet;
          log(ApiManager.empDetailsEndPoint + _error);
          isProgress = false;
          notifyListeners();
        } else {
          _value = [];
          for (int i = 0; i < _localList.length; i++) {
            _value.add(EmployeeDetails(
                id: _localList[i].id,
                name: _localList[i].name,
                username: _localList[i].username,
                email: _localList[i].email,
                profileImage: _localList[i].profileImage,
                phone: _localList[i].phone,
                website: _localList[i].website,
                address: Address(
                    street: _localList[i].street,
                    suite: _localList[i].suite,
                    city: _localList[i].city,
                    zipcode: _localList[i].zipcode ?? Strings.notSpecified,
                    geo: Geo(
                        lat: _localList[i].lat.toString(),
                        lng: _localList[i].lng.toString())),
                company: Company(
                    name: _localList[i].companyName ?? Strings.notSpecified,
                    catchPhrase:
                        _localList[i].catchPhrase ?? Strings.notSpecified,
                    bs: _localList[i].bs ?? Strings.notSpecified)));
          }
          isProgress = false;
          _searchBackup = _value;
          notifyListeners();
        }
      } else if (e is HttpException) {
        _error = Strings.somethingWentWrongWhileCallingHttp;
        log(ApiManager.empDetailsEndPoint + _error);
        isProgress = false;
        notifyListeners();
      } else if (e is FormatException) {
        _error = Strings.pleaseCheckUrlFormate;
        log(ApiManager.empDetailsEndPoint + _error);
        isProgress = false;
        notifyListeners();
      } else {
        log(e.toString());
      }
    }
  }

  onSearchTriggered({required String query}) {
    final suggestion = _value.where((element) {
      final name = element.username.toLowerCase();
      final input = query.toLowerCase();
      final companyName = element.company == null
          ? Strings.notSpecified
          : element.company!.name.toLowerCase();
      return name.contains(input) || companyName.contains(input);
    }).toList();
    if (query.isEmpty) {
      log(_searchBackup.toString());
      _value = _searchBackup;
      notifyListeners();
    } else {
      _value = suggestion;
      notifyListeners();
    }
  }
}
