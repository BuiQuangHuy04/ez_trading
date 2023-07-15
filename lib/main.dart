import 'package:ez_trading_v2/core/app_color.dart';
import 'package:ez_trading_v2/src/providers/order_provider.dart';
import 'package:ez_trading_v2/src/views/screens/home_screen.dart';
import 'package:ez_trading_v2/src/views/widgets/my_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor().darkBackgroundColor,
            title: const MyAppNameWidget(),
            centerTitle: true,
          ),
          body: const HomeScreen(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}