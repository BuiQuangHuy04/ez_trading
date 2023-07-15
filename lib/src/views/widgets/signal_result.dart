import 'dart:convert';

import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/data_sources/local/app_shared_pref.dart';
import 'package:ez_trading_v2/src/models/order.dart';
import 'package:flutter/material.dart';

class SignalResultWidget extends StatefulWidget {
  const SignalResultWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignalResultWidgetState();
  }

}

class SignalResultWidgetState extends State<SignalResultWidget> {

  Set<Order> setOrders = <Order>{};
  String totalSignals = '';
  String totalWinSignals = '';
  String totalPercentWinsSignals = '';
  AppStyle style = AppStyle();
  AppColor color = AppColor();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,(){
      setState(() {
        _getData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color.darkBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalWinSignals,
                    style: style.resultDetailTextStyle,
                  ),
                  Text(
                    'wins',
                    style: style.resultTitleTextStyle,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    totalSignals,
                    style: style.resultDetailTextStyle,
                  ),
                  Text(
                    'signals',
                    style: style.resultTitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getData() async {
    var pref = AppSharedPref.instance();

    var data = await pref.getString(key: AppSharedKeys.listOrders);

    var jsonData = jsonDecode(data) as Map<String, dynamic>;

    for (var json in jsonData.values) {
      var order = Order.fromJson(json);
      setOrders.add(order);
    }

    totalSignals = _totalSignals();
    totalWinSignals = _totalWinSignals();
    totalPercentWinsSignals = _totalPercentWinSignals();

  }

  String _totalSignals() {
    return setOrders.length.toString();
  }

  String _totalWinSignals() {
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

    return sum.toString();
  }

  String _totalPercentWinSignals() {
    return (double.parse(_totalWinSignals())/setOrders.length)
        .toPrecision(2).toString();
  }
}