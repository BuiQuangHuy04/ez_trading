import 'dart:ffi';

import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/models/order.dart';
import 'package:ez_trading_v2/src/views/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;
  final AppUtils utils = AppUtils();
  OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    AppColor color = AppColor();
    AppUtils utils = AppUtils();
    AppStyle style = AppStyle();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const MyAppNameWidget(),
        centerTitle: true,
        backgroundColor: color.darkBackgroundColor,
      ),
      body: SafeArea(
        child: Container(
          color: color.darkBackgroundColor,
          constraints: const BoxConstraints.tightForFinite(),
          alignment: Alignment.topCenter,
          height: height,
          child: ListView(
            children: [
              _buildInImgOrderPair(order, utils, width),
              _buildInCardOrderFieldInfo
                ('pair',order.pair,color,style),
              _buildInCardOrderFieldInfo
                ('type',order.type,color,style),
              _buildInCardOrderFieldInfo
                ('open time',utils.convertTime(order.openTime),color,style),
              _buildInCardOrderFieldInfo
                ('open price',order.openPrice,color,style),
              _buildInCardOrderFieldInfo
                ('take profit',order.tp,color,style),
              _buildInCardOrderFieldInfo
                ('stop loss',order.sl,color,style),
              _buildInCardOrderFieldInfo
                ('status',_getOrderStatus(order),color,style),
            ],
          ),
        ),
      ),
    );
  }

  String _getOrderStatus(Order order) {
    String status;

    if (order.closePrice == '0') {
      status = 'order is running';
    } else {
      status = 'closed at ${order.closePrice}(${_calculatePip(order)} pips)';
    }

    return status;
  }

  int _calculatePip(Order order) {

    double pip = 0;
    double openPrice = double.parse(order.openPrice);
    double closePrice = double.parse(order.closePrice);

    int level = order.openPrice.substring(
        0,order.openPrice.toString().indexOf('.')
    ).length;

    switch (level) {
      case 1:
        pip = (openPrice - closePrice)*10000;
        break;
      case 2:
        pip = (openPrice - closePrice)*1000;
        break;
      case 3:
        pip = (openPrice - closePrice)*100;
        break;
      case 4:
        pip = (openPrice - closePrice)*10;
        break;
      case 5:
        pip = (openPrice - closePrice)/10;
        break;
    }

    return pip.abs().toPrecision(0).toInt();
  }
}

Widget _buildInCardOrderFieldInfo(String title, String value, AppColor color, AppStyle style){
  return Container(
    padding: const EdgeInsets.all(30),
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color.darkBackgroundContainerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '$title:',
                style: style.defaultTextStyle,
              ),
            )
          ),

          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                value,
                style: value == 'BUY'?
                style.orderGreenTextStyle :
                value == 'SELL'?
                style.orderRedTextStyle :
                style.orderOtherInfoTextStyle
              ),
            )
          )
        ],
      ),
      ),
    ),
  );
}

Widget _buildInImgOrderPair(Order order, AppUtils utils, double deviceWidth){
  return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          utils.getPairImg(order.pair.substring(0,3)),
          alignment: Alignment.centerLeft,
          fit: BoxFit.contain,
          width: deviceWidth*0.45,
        ),
        SvgPicture.asset(
          utils.getPairImg(order.pair.substring(3,6)),
          alignment: Alignment.centerRight,
          fit: BoxFit.contain,
          width: deviceWidth*0.45,
        ),
      ]
  );
}