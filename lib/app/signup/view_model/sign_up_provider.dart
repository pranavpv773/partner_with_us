import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partner_app/app/home/view/home_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';

class SignUpProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final conformpassword = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final FirebaseAuth firebase = FirebaseAuth.instance;
  bool activityIndicator = false;
  buttonFn(BuildContext context) async {
    if (signUpFormKey.currentState!.validate()) {
      if (password.text != conformpassword.text) {
        Fluttertoast.showToast(
          msg: "password not matching",
          toastLength: Toast.LENGTH_LONG,
        );
      } else {
        try {
          await firebase
              .createUserWithEmailAndPassword(
                  email: userName.text, password: password.text)
              .then((value) => AppRoutes.removeScreenUntil(
                      screen: const HomeScreen(
                    type: LoginType.email,
                  )));
        } on FirebaseAuthException catch (e) {
          Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_LONG,
          );
        }
      }
    }
  }
}
