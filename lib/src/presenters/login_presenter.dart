import 'dart:async';
import 'dart:convert';

import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/data_sources/local/app_shared_pref.dart';
import 'package:ez_trading_v2/src/data_sources/repositories/auth_repository.dart';
import 'package:ez_trading_v2/src/models/user.dart';
import 'package:flutter/cupertino.dart';

class LoginPresenter {
  AuthRepository? _repository;
  LoginPresenter() {
    _repository = AuthRepositoryImpl();
  }

  Future<void> login(String email, String password) async {
    assert(_repository != null);
    User user =  User(
        kind: '',
        localId: '',
        email: '',
        displayName: '',
        idToken: '',
        registered: false,
        profilePicture: '');
    AppUtils appUtils = AppUtils();

    if(password.isEmpty | email.isEmpty) {
      appUtils.showToast('Email & password  can\'t be empty!');
    } else if(!appUtils.isValidEmail(email)) {
      appUtils.showToast('Email is invalid!');
    } else {
      _repository!.login(email, password).then((value) async {
        if (value.statusCode == 200) {
          user = User.fromJson(jsonDecode(value.body));
          await _saveAccessToken(user.idToken);
          await _saveSignedInUser(value.body);
        } else {
          print(value.statusCode);
          AppUtils().showToast('Email or password is incorrect!');
        }
      }).catchError((onError) => print(onError));
    }
  }

  Future<void> _saveAccessToken(String token) async {
    AppSharedPref.instance()
      .putString(key: AppSharedKeys.apiToken, value: token);
  }

  Future<void> _saveSignedInUser(String json) async {
    AppSharedPref.instance()
      .putString(key: AppSharedKeys.currentUser, value: json);
  }
}