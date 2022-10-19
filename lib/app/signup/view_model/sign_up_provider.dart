import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partner_app/app/home/view/home_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final conformpassword = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final FirebaseAuth firebase = FirebaseAuth.instance;
  bool signupIndicator = false;
  buttonFn(BuildContext context) async {
    final shared = await SharedPreferences.getInstance();
    if (signUpFormKey.currentState!.validate()) {
      signupIndicator = true;
      notifyListeners();
      if (password.text != conformpassword.text) {
        Fluttertoast.showToast(
          msg: "password not matching",
          toastLength: Toast.LENGTH_LONG,
        );
        signupIndicator = false;
        notifyListeners();
      } else {
        try {
          await firebase
              .createUserWithEmailAndPassword(
                  email: userName.text, password: password.text)
              .then(
            (value) {
              signupIndicator = false;
              shared.setBool('login', true);
              disposeCntrller();
              notifyListeners();
              return AppRoutes.removeScreenUntil(
                screen: const HomeScreen(
                  type: LoginType.email,
                ),
              );
            },
          );
        } on FirebaseAuthException catch (e) {
          signupIndicator = false;
          notifyListeners();
          Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_LONG,
          );
        }
      }
    }
  }

  void disposeCntrller() {
    userName.clear();
    password.clear();
    conformpassword.clear();
  }
}
