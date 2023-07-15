import 'package:ez_trading_v2/core/app_color.dart';
import 'package:flutter/material.dart';

class AppStyle {

  static AppColor appColor = AppColor();

  TextStyle appNameTextStyle1 = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 26,
    fontWeight: FontWeight.w900,
    color: appColor.darkTextColor1,
  );

  TextStyle appNameTextStyle2 = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 26,
    fontWeight: FontWeight.w900,
    color: appColor.darkTextColor2,
  );

  TextStyle resultDetailTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: appColor.defaultTakeProfitColor,
  );

  TextStyle resultTitleTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: appColor.defaultTextColor,
  );

  TextStyle orderPairTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: appColor.defaultTextColor,
  );

  TextStyle orderGreenTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: appColor.defaultTakeProfitColor,
  );

  TextStyle orderRedTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: appColor.defaultStopLossColor,
  );

  TextStyle orderOtherInfoTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: appColor.defaultTextColor,
  );

  TextStyle defaultTextStyle = TextStyle(
    fontFamily: 'Courier New',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: appColor.defaultTextColor,
  );
}