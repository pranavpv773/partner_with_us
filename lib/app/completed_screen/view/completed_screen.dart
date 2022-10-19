import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/app/home/view/home_screen.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app_style/app_images.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';

class OnCompletedScreen extends StatelessWidget {
  const OnCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyle.primary1,
          centerTitle: true,
          title: IconButton(
              onPressed: () {
                AppRoutes.removeScreen(
                  screen: const HomeScreen(),
                );
              },
              icon: const Icon(Icons.food_bank)),
        ),
        body: ContainerWidget(
            width: AppStyle.size.width,
            height: AppStyle.size.height,
            color: AppStyle.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInRightBig(
                  child: Image.asset(
                    AppImages.completed,
                  ),
                ),
                FadeInLeftBig(
                  child: Text(
                    "Successfully Competed",
                    style: AppTextStyles.h1,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
