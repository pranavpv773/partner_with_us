import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:partner_app/app/home/view/home_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  final FirebaseAuth firebase = FirebaseAuth.instance;
  buttonFn(BuildContext context) async {
    if (signInFormKey.currentState!.validate()) {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth
            .signInWithEmailAndPassword(
                email: userName.text, password: password.text)
            .then(
              (value) => {
                AppRoutes.removeScreenUntil(
                  screen: const HomeScreen(),
                ),
              },
            );
        notifyListeners();
        userName.clear();
        password.clear();
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
  }

  void googleLogIn() async {
    try {
      notifyListeners();
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        notifyListeners();
        Fluttertoast.showToast(
          msg: " e.message.toString()",
          toastLength: Toast.LENGTH_LONG,
        );
      }
      final cred = await result!.authentication;
      await firebase
          .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: cred.accessToken, idToken: cred.idToken))
          .then((value) =>
              AppRoutes.removeScreenUntil(screen: const HomeScreen()));

      notifyListeners();
      Fluttertoast.showToast(
        msg: "Succesfully Logged in",
        toastLength: Toast.LENGTH_LONG,
      );
    } on FirebaseAuthException catch (exe) {
      Fluttertoast.showToast(
        msg: exe.message.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
      notifyListeners();
    }
  }
}
