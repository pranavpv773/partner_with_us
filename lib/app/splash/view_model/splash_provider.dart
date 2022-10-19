import 'package:flutter/widgets.dart';
import 'package:partner_app/app/sign_in/view/sign_in_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';

class SplashProvider with ChangeNotifier {
  Future<void> screenDelayed() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then((value) => AppRoutes.removeScreenUntil(
          screen: const SignInScreen(),
        ));
  }
}
