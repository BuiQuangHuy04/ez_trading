import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/data_sources/repositories/auth_repository.dart';
import 'package:ez_trading_v2/src/views/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpPresenter {
  AuthRepository? _repository;
  SignUpPresenter() {
    _repository = AuthRepositoryImpl();
  }

  AppUtils utils = AppUtils();

  void signup(
      String email, String password,
      String confirmPassword, BuildContext context) {
    assert(_repository != null);

    if(confirmPassword.isEmpty | password.isEmpty | email.isEmpty) {
      utils.showToast(
          'Email & password & confirmed password can\'t be empty!');
    } else if(!utils.isValidEmail(email)) {
      utils.showToast('Email is invalid!');
    } else if (password != confirmPassword) {
      utils.showToast('Invalid confirmed password!');
    } else {
      _repository!.signup(email,password,confirmPassword).then((value) {
        print(value.body.toString());
        if(value.statusCode == 200) {
          utils.showToast(
              'Sign-up successfully!'
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen())
          );
        } else {
          utils.showToast(
              'Sign-up error!'
          );
        }
      })
          .catchError((onError) => print(onError));
    }
  }
}