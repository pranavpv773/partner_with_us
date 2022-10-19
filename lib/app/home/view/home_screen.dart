import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:partner_app/app/partner_form/view/form_screen.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app/sign_in/view/sign_in_screen.dart';
import 'package:partner_app/app/sign_in/view_model/sign_in_provider.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app_style/app_images.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginType { google, email }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.type}) : super(key: key);
  final LoginType? type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primary1,
        title: const Text("Welcome"),
        actions: [
          IconButton(
              onPressed: () async {
                if (type == LoginType.google) {
                  final shared = await SharedPreferences.getInstance();

                  GoogleSignIn().signOut().then(
                    (value) {
                      shared.setBool('login', false);
                      return AppRoutes.removeScreenUntil(
                        screen: const SignInScreen(),
                      );
                    },
                  );
                } else {
                  context.read<SignInProvider>().logOut(context).then(
                        (value) => AppRoutes.removeScreenUntil(
                          screen: const SignInScreen(),
                        ),
                      );
                }
              },
              icon: const Icon(
                Icons.logout_outlined,
              ))
        ],
      ),
      body: ContainerWidget(
        height: AppStyle.size.height,
        width: AppStyle.size.width,
        color: AppStyle.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.welcome1),
                ButtonWidget(
                    text: "Partner With US",
                    fn: () => AppRoutes.nextScreen(screen: const FormScreen())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
