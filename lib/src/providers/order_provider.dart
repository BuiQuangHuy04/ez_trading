import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  bool _isProcessing = true;
  bool get isProcessing => _isProcessing;
  void updateProcessing() {
    _isProcessing = !_isProcessing;
    notifyListeners();
  }

  Set<Order> _setOrders = <Order>{};
  Set<Order> get setOrders => _setOrders;
  Future<void> updateSetOrders(Set<Order> set) async {
    if(_setOrders.isNotEmpty) _setOrders.clear();
    _setOrders.addAll(set);
    notifyListeners();
  }
  Future<void> addToSetOrders(Order order) async {
    _setOrders.add(order);
    notifyListeners();
  }
  Future<void> clearSetOrders() async {
    if(_setOrders.isNotEmpty) _setOrders.clear();
    notifyListeners();
  }
  Future<void> sortSetOrders() async {
    _setOrders = Set.from(
        _setOrders.toList()..sort((e1, e2) => orderByTime(e1, e2)));
    notifyListeners();
  }


  String _totalSignals = '0';
  String get totalSignals => _totalSignals;
  Future<void> updateTotalSignals() async {
    _totalSignals = setOrders.length.toString();
    notifyListeners();
  }

  String _totalWinSignals = '0';
  String get totalWinSignals => _totalWinSignals;
  Future<void> updateTotalWinSignals() async {
    int sum = 0;

    for(var order in setOrders) {
      switch (order.type) {
        case 'BUY':
          if(order.closePrice != '0' &&
              double.parse(order.closePrice) - double.parse(order.openPrice) > 0) {
            sum++;
          }
          break;
        case 'SELL':
          if(order.closePrice != '0' &&
              double.parse(order.closePrice) - double.parse(order.openPrice) < 0) {
            sum++;
          }
          break;
      }
    }
    _totalWinSignals = sum.toString();
    notifyListeners();
  }

  String _totalPercentWinSignals = '0';
  String get totalPercentWinSignals => _totalPercentWinSignals;
  Future<void> updateTotalPercentWinSignals() async {
    var percent = (double.parse(totalWinSignals)/double.parse(totalSignals)*100)
        .toPrecision(2).toString();

    _totalPercentWinSignals = percent.toString();
    notifyListeners();
  }

  int orderByTime(Order a, Order b) {
    final timeA = int.parse(a.openTime);
    final timeB = int.parse(b.openTime);
    return timeA.compareTo(timeB);
  }
}