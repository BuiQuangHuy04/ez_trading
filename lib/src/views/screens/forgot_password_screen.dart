import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/core/app_utils.dart';
import 'package:ez_trading_v2/src/data_sources/local/app_shared_pref.dart';
import 'package:ez_trading_v2/src/presenters/forgot_password_presenter.dart';
import 'package:ez_trading_v2/src/views/screens/login_screen.dart';
import 'package:ez_trading_v2/src/views/widgets/in_app_logo.dart';
import 'package:ez_trading_v2/src/views/widgets/input_email.dart';
import 'package:ez_trading_v2/src/views/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordScreenState();
  }
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AppStyle style = AppStyle();
  final AppColor color = AppColor();
  final AppUtils utils = AppUtils();

  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPresenter? _forgotPasswordPresenter;

  @override
  void initState() {
    super.initState();

    _forgotPasswordPresenter = ForgotPasswordPresenter();

  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const MyAppNameWidget(),
        centerTitle: true,
        backgroundColor: AppColor().darkBackgroundColor,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Container(
                height: height,
                width: width,
                color: color.darkBackgroundColor,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const InAppLogoWidget(),
                    InputEmailWidget(controller: emailController),
                    _buildInBtnReset()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInBtnReset() {
    return Container(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color.darkBackgroundContainerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,5,15,5),
          child: TextButton(
            onPressed: () async {
              Fluttertoast.cancel();

              _forgotPasswordPresenter!.reset(emailController.text, context);

            },
            child: Text(
              'Reset',
              style: style.defaultTextStyle,
            ),
          ),
        ),
      ),
    );
  }

}