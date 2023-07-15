import 'package:ez_trading_v2/src/data_sources/repositories/app_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

import 'package:ez_trading_v2/src/data_sources/api_urls.dart';

abstract class SignalsRepository {
  Future<http.Response> fetchData();
  final DatabaseReference ref = FirebaseDatabase.instance.ref('orders');
}

class SignalsRepositoryImpl implements SignalsRepository {
  @override
  Future<http.Response> fetchData() async {

    String url = '$SIGNALS_DOMAIN$ordersEP';

    http.Response response = await AppRepository.init()
      .sendRequest(
        RequestMethod.GET,
        url,
        false,
    ).timeout(const Duration(seconds: 15));

    return response;
  }

  @override
  DatabaseReference get ref => FirebaseDatabase.instance.ref('orders');
}