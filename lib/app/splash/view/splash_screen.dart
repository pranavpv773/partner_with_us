import 'package:flutter/material.dart';
import 'package:partner_app/app/splash/view_model/splash_provider.dart';
import 'package:partner_app/app_style/app_images.dart';
import 'package:partner_app/app_style/app_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SplashProvider().screenDelayed();
    });
    return Scaffold(
      body: Container(
        width: AppStyle.size.width,
        height: AppStyle.size.height,
        color: AppStyle.primary,
        child: Image.asset(
          AppImages.delivery,
        ),
      ),
    );
  }
}
