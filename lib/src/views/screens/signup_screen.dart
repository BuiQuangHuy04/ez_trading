import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/core/app_style.dart';
import 'package:ez_trading_v2/src/presenters/signup_presenter.dart';
import 'package:ez_trading_v2/src/views/widgets/in_app_logo.dart';
import 'package:ez_trading_v2/src/views/widgets/input_email.dart';
import 'package:ez_trading_v2/src/views/widgets/input_pass.dart';
import 'package:ez_trading_v2/src/views/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();

  final AppStyle style = AppStyle();
  final AppColor color = AppColor();

  late SignUpPresenter _signUpPresenter;

  @override
  void initState() {
    super.initState();

    _signUpPresenter = SignUpPresenter();
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
                    const InAppLogoWidget(),
                    InputEmailWidget(controller: emailController),
                    InputPassWidget(controller: passController),
                    InputPassWidget(controller: rePassController),
                    _buildInBtnSignup(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInBtnSignup() {
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

              _signUpPresenter.signup(
                  emailController.text,
                  passController.text,
                  rePassController.text,
                  context);
            },
            child: Text(
              'Sign Up',
              style: style.defaultTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}