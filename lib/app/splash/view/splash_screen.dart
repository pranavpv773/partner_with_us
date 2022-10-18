import 'package:flutter/material.dart';
import 'package:partner_app/app_style/app_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppStyle.size.width,
        height: AppStyle.size.height,
        color: Colors.amber,
      ),
    );
  }
}
