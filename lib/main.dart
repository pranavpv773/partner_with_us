import 'package:flutter/material.dart';
import 'package:partner_app/app/splash/view/splash_screen.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRoutes.navigatorKey,
      scaffoldMessengerKey: AppStyle.rootScaffoldMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
