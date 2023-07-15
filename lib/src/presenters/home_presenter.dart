import 'package:ez_trading_v2/src/data_sources/repositories/signals_repository.dart';

class HomePresenter {

  SignalsRepository? _repository;

  HomePresenter() {
    _repository = SignalsRepositoryImpl();
  }

  Future<void> fetchRealtimeData(Function onChange) async {
    assert (_repository != null);
    _repository!.ref.onValue.listen((event) {onChange(event);});
  }

}