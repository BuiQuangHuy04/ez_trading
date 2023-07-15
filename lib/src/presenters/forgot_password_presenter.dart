import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/data_sources/repositories/auth_repository.dart';
import 'package:ez_trading_v2/src/views/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPresenter {
  AuthRepository? _repository;
  ForgotPasswordPresenter() {
    _repository = AuthRepositoryImpl();
  }

  AppUtils utils = AppUtils();

  void reset(String email, BuildContext context) {
    assert(_repository != null);

    AppUtils appUtils = AppUtils();

    if(email.isEmpty) {
      appUtils.showToast('Email can\'t be empty!');
    } else if(!appUtils.isValidEmail(email)) {
      appUtils.showToast('Email is invalid!');
    }

    _repository!.reset(email).then((value) {
      print(value.body.toString());
      if(value.statusCode == 200) {
        utils.showToast(
          'A link reset password has been send to your email!'
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginScreen())
        );
      } else {
        utils.showToast(
            'Email not found!'
        );
      }
    })
      .catchError((onError) => print(onError));
  }
}