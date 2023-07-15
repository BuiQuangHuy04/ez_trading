import 'package:ez_trading_v2/core/app_icon.dart';
import 'package:flutter/material.dart';

class InAppLogoWidget extends StatelessWidget {
  const InAppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {

    AppIcon appIcon = const AppIcon();

    final width = MediaQuery.of(context).size.width/2;

    return Center(
      child: Image.asset(
        appIcon.appLogo,
        width: width,
        height: width,
      ),
    );
  }
}