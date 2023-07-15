import 'package:http/http.dart' as http;

import 'package:ez_trading_v2/src/data_sources/api_urls.dart';
import 'package:ez_trading_v2/src/data_sources/repositories/app_repository.dart';
import 'package:ez_trading_v2/src/data_sources/api_key.dart';

abstract class AuthRepository {
  Future<http.Response> signup(
      String email, String password, String confirmPassword);
  Future<http.Response> reset(String email);
  Future<http.Response> login(String email, String password);
  Future<http.Response> logout();
  Future<http.Response> changePassword(
      String oldPassword, String newPassword, String confirmNewPassword);
}

class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<http.Response> signup(
      String email, String password, String confirmPassword) async {
    String url = '$AUTH_DOMAIN$signupEP?key=$API_KEY';

    http.Response response = await AppRepository.init()
        .sendRequest(
      RequestMethod.POST,
      url,
      false,
      body: <String, String>{'email': email, 'password': password},
    ).timeout(const Duration(seconds: 15));

    return response;
  }

  @override
  Future<http.Response> reset(String email) async {
    String url = '$AUTH_DOMAIN$resetPassEP?key=$API_KEY';

    http.Response response = await AppRepository.init()
      .sendRequest(
        RequestMethod.POST,
        url,
        false,
        body: <String, String>{'requestType': 'PASSWORD_RESET', 'email': email},
      ).timeout(const Duration(seconds: 15));

    return response;
  }

  @override
  Future<http.Response> login(String email, String password) async {
    String url = '$AUTH_DOMAIN$loginEP?key=$API_KEY';

    http.Response response = await AppRepository.init()
      .sendRequest(
        RequestMethod.POST,
        url,
        false,
        body: <String, String>{'email': email, 'password': password},
      ).timeout(const Duration(seconds: 15));

    return response;
  }

  @override
  Future<http.Response> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<http.Response> changePassword(String oldPassword, String newPassword, String confirmNewPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}