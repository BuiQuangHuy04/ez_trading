import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:flutter/material.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {

    AppColor appColor = AppColor();
    AppStyle appStyle = AppStyle();
    AppUtils appUtils = AppUtils();

    return Padding(
      padding: const EdgeInsets.fromLTRB(30,15,30,15),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: appColor.darkBackgroundContainerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,5,20,5),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'email',
              hintStyle: appStyle.defaultTextStyle,
              prefixIcon: const Icon(Icons.email_outlined),
              prefixIconColor: appColor.darkBackgroundColor,
            ),
            keyboardType: TextInputType.emailAddress,
            style: appStyle.defaultTextStyle,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }

}