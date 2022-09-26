import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task/constants/api_manager.dart';

import 'package:task/models/model_github.dart';
import 'package:task/repository/github_repo.dart';

class VmGithub extends ChangeNotifier {
  // ----------------------------------- Getters -------------------------------
  String get error => _error;
  List get images => _images;
  List get strings => _strings;
  List<Item> get values => _value;

  ScrollController get scrollController => _listViewController;

  // ---------------------------------- Variables ------------------------------

  String _error = '';
  int page = 1;
  bool isProgress = true;
  final List _images = [];
  final List _strings = [];
  late List<Item> _value;

  final _listViewController = ScrollController();

  // --------------------------------- Methods ---------------------------------
  Future onGetRepos({required page}) async {
    try {
      var response = await GitHubRepository.getRepositoryResponse(page: page);
      if (response == null) {
        _error = 'Something went wrong';
        log(ApiManager.gitHubEndPoint + " Something went wrong");
        notifyListeners();
      } else {
        log(ApiManager.gitHubEndPoint + " Success");
        if (page == "1") {
          _value = response;
          isProgress = false;
          notifyListeners();
        } else {
          _value.addAll(response);
          notifyListeners();
        }
      }
    } on Exception catch (e) {
      if (e is SocketException) {
        _error = 'Please check your Internet connction';
        log(ApiManager.gitHubEndPoint + _error);
        isProgress = false;
        notifyListeners();
      } else if (e is HttpException) {
        _error = 'Something went wrong while calling http';
        log(ApiManager.gitHubEndPoint + _error);
        isProgress = false;
        notifyListeners();
      } else if (e is FormatException) {
        _error = 'Please check URL formate and try again';
        log(ApiManager.gitHubEndPoint + _error);
        isProgress = false;
        notifyListeners();
      }
    }
  }
}
