import 'package:flutter/widgets.dart';
import 'package:partner_app/app/partner_form/view/form_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';

class SplashProvider with ChangeNotifier {
  Future<void> screenDelayed() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then((value) => AppRoutes.removeScreenUntil(
          screen: const FormScreen(),
        ));
  }
}
