import 'package:ez_trading_v2/core/app_style.dart';
import 'package:flutter/material.dart';

class MyAppNameWidget extends StatelessWidget {
  const MyAppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {

    AppStyle appStyle = AppStyle();

    return RichText(
        text: TextSpan(
          text: 'EZ',
          style: appStyle.appNameTextStyle1,
          children: [
            TextSpan(
              text: 'Trading',
              style: appStyle.appNameTextStyle2,
            ),
          ]
        ),
    );
  }

}