import 'package:flutter/widgets.dart';
import 'package:partner_app/app/home/view/home_screen.dart';
import 'package:partner_app/app/sign_in/view/sign_in_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  Future<void> screenDelayed() async {
    final checkLogged = await SharedPreferences.getInstance();
    final checkResult = checkLogged.getBool('login') ?? false;
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    if (checkResult) {
      AppRoutes.removeScreen(
        screen: const HomeScreen(),
      );
    } else {
      AppRoutes.removeScreen(
        screen: const SignInScreen(),
      );
    }
  }
}
