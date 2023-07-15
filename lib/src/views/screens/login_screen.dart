import 'package:ez_trading_v2/src/data_sources/local/app_shared_pref.dart';
import 'package:ez_trading_v2/src/views/screens/forgot_password_screen.dart';
import 'package:ez_trading_v2/src/views/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/src/presenters/login_presenter.dart';
import 'package:ez_trading_v2/src/views/widgets/in_app_logo.dart';
import 'package:ez_trading_v2/src/views/widgets/input_email.dart';
import 'package:ez_trading_v2/src/views/widgets/input_pass.dart';
import 'package:ez_trading_v2/src/views/widgets/my_app_bar.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  MyAppNameWidget myAppNameWidget = const MyAppNameWidget();
  InAppLogoWidget inAppLogoWidget = const InAppLogoWidget();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final AppStyle style = AppStyle();
  final AppColor color = AppColor();

  LoginPresenter? _loginPresenter;

  @override
  void initState() {
    super.initState();

    _loginPresenter = LoginPresenter();

  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        onTap: (){
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      inAppLogoWidget,
                      myAppNameWidget,
                    ],
                  ),

                  InputEmailWidget(controller: emailController),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InputPassWidget(controller: passController),
                      _buildInBtnForgotPass(),
                    ],
                  ),

                  _buildInBtnSignIn(),

                  _buildInBtnSignUp(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLoginSuccess() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Widget _buildInBtnSignIn() {
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

              _loginPresenter!.login(
                emailController.text,
                passController.text).then(
                  (value) {

                    AppSharedPref.instance().getString(
                      key: AppSharedKeys.currentUser)
                      .then((value) {
                        if(value.isNotEmpty) {



                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()
                            )
                          );
                        }
                    });
                  }
                );

            },
            child: Text(
              'Login',
              style: style.defaultTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInBtnForgotPass() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,5,15,5),
        child: TextButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen()
              ),
            );
          },
          child: Text(
            'Forgot password',
            style: style.defaultTextStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildInBtnSignUp() {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,5,15,5),
        child: TextButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SignUpScreen()
              ),
            );
          },
          child: Text(
            'Sign up',
            style: style.defaultTextStyle,
          ),
        ),
      ),
    );
  }
}