import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_urls.dart';

class AppRepository {
  AppRepository._();

  static final AppRepository _repositories = AppRepository._();
  factory AppRepository.init() => _repositories;

  Future<http.Response> sendRequest(method, String url, bool hasToken,
    {Object? body, Encoding? encoding}) async {

    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    if (method == RequestMethod.GET) {
      return http.get(Uri.parse(url), headers: headers);
    }

    if (method == RequestMethod.POST) {
      return http.post(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    }

    if (method == RequestMethod.PUT) {
      return http.put(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    }
    if (method == RequestMethod.PATCH) {
      return http.patch(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    }

    if (method == RequestMethod.DELETE) {
      return http.delete(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    }

    return http.get(Uri.parse(url), headers: headers);
  }
}