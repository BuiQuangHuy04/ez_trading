import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget orderWidget(BuildContext context, Order order) {

  final AppColor color = AppColor();
  final AppStyle style = AppStyle();
  final AppUtils utils = AppUtils();

  return Container(
    margin: const EdgeInsets.all(15),
    height: 100,
    alignment: Alignment.center,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.darkBackgroundContainerColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      utils.getPairImg(order.pair.substring(0,3)),
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      utils.getPairImg(order.pair.substring(3,6)),
                      alignment: Alignment.centerRight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ]
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,5,5,5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.pair,
                          style: style.defaultTextStyle,
                        ),
                        Text(
                          order.openPrice,
                          style: style.defaultTextStyle,
                        ),
                        Text(
                          order.type,
                          style: order.type == 'BUY' ?
                            style.orderGreenTextStyle :
                            style.orderRedTextStyle,
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TP:${order.tp}',
                          style: style.orderGreenTextStyle,
                        ),
                        Text(
                          'SL:${order.sl}',
                          style: style.orderRedTextStyle,
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      utils.convertTime(order.openTime),
                      style: style.orderOtherInfoTextStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );

}