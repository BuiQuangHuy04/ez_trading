import 'dart:convert';

import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/src/models/order.dart';
import 'package:ez_trading_v2/src/presenters/home_presenter.dart';
import 'package:ez_trading_v2/src/providers/order_provider.dart';
import 'package:ez_trading_v2/src/views/screens/order_detail_screen.dart';
import 'package:ez_trading_v2/src/views/widgets/order_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late HomePresenter _presenter;
  late OrderProvider _orderProvider;
  AppStyle style = AppStyle();
  AppColor color = AppColor();

  late CircularProgressIndicator _loading;

  @override
  void initState() {
    super.initState();

    _presenter = HomePresenter();
    _orderProvider = OrderProvider();
    _loading = CircularProgressIndicator(
      color: color.defaultTextColor,
    );
    Future.delayed(const Duration(milliseconds: 1500),(){
      setState(() {
        _getData().whenComplete((){
          context.read<OrderProvider>().updateProcessing();
        });
      });
    });
  }

  @override
  void dispose() {
    _orderProvider.dispose();
    super.dispose();
  }

  Future<void> _getData() async {
    await _presenter.fetchRealtimeData((DatabaseEvent event){
      context.read<OrderProvider>().clearSetOrders();
      var listJson = event.snapshot.value as Map<Object?, Object?>;
      for (var json in listJson.values) {
        var order = Order.fromJson(jsonDecode(jsonEncode(json)));
        context.read<OrderProvider>().addToSetOrders(order);
      }
      context.read<OrderProvider>().sortSetOrders().whenComplete(() {

        context.read<OrderProvider>().updateTotalSignals();
        context.read<OrderProvider>().updateTotalWinSignals();
        context.read<OrderProvider>().updateTotalPercentWinSignals();

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final AppColor color = AppColor();

    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,overlays: [SystemUiOverlay.bottom]);

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              //result
              Consumer(
                builder: (context, provider, child) {
                  return Expanded(
                    flex: MediaQuery.of(context).orientation
                        == Orientation.portrait? 1 : 2,
                    child: Container(
                      color: color.darkBackgroundColor,
                      alignment: Alignment.center,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: color.darkBackgroundColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //wins
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${context.watch<OrderProvider>()
                                        .totalWinSignals}'
                                        '(${context.watch<OrderProvider>()
                                        .totalPercentWinSignals}%)',
                                    style: style.resultDetailTextStyle,
                                  ),
                                  Text(
                                    'wins',
                                    style: style.resultTitleTextStyle,
                                  ),
                                ],
                              ),
                            ),

                            //total
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.watch<OrderProvider>().totalSignals,
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
                    ),
                  );
                },
              ),

              //list order

              Expanded(
                flex: 8,
                child: Container(
                  color: color.darkBackgroundColor,
                  child: Consumer<OrderProvider>(
                    builder: (context, provider, child) {
                      return ListView.builder(
                        itemCount: context.watch<OrderProvider>().setOrders.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var order = context.watch<OrderProvider>().setOrders
                              .elementAt(context.watch<OrderProvider>()
                                  .setOrders.length - 1 - index);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderDetailScreen(order: order,)
                                ),
                              );
                            },
                            child: orderWidget(context,order),
                          );
                        },
                      );
                    }
                  ),
                ),
              ),

            ],
          ),

          Consumer<OrderProvider>(
            builder: (context, provider, child) {
              if(context.watch<OrderProvider>().isProcessing) {
                return Center(
                  child: _loading,
                );
              } else {
                return Container();
              }
            },
          )
        ]
      )
    );
  }
}