import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:partner_app/app/home/view/home_screen.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  final FirebaseAuth firebase = FirebaseAuth.instance;
  bool activityIndicator = false;
  bool isLoading = false;
  buttonFn(BuildContext context) async {
    if (signInFormKey.currentState!.validate()) {
      final shared = await SharedPreferences.getInstance();
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth
            .signInWithEmailAndPassword(
                email: userName.text, password: password.text)
            .then(
              (value) => {
                shared.setBool('login', true),
                AppRoutes.removeScreenUntil(
                  screen: const HomeScreen(
                    type: LoginType.email,
                  ),
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

  Future<void> logOut(BuildContext context) async {
    final shared = await SharedPreferences.getInstance();
    await firebase.signOut().then(
          (value) => shared.setBool('login', false),
        );
  }

  void googleLogIn() async {
    final shared = await SharedPreferences.getInstance();

    try {
      activityIndicator = true;
      notifyListeners();
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) {
        GoogleSignIn().signOut().then((value) {
          return activityIndicator = true;
        });
        notifyListeners();
      }
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        activityIndicator = false;
        shared.setBool('login', false);
        notifyListeners();
        Fluttertoast.showToast(
          msg: "somme error",
          toastLength: Toast.LENGTH_LONG,
        );
      }
      final cred = await result!.authentication;
      await firebase
          .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: cred.accessToken, idToken: cred.idToken))
          .then((value) {
        shared.setBool('login', true);
        activityIndicator = false;
        return AppRoutes.removeScreenUntil(
            screen: const HomeScreen(
          type: LoginType.google,
        ));
      });

      notifyListeners();
      Fluttertoast.showToast(
        msg: "Succesfully Logged in",
        toastLength: Toast.LENGTH_LONG,
      );
    } on FirebaseAuthException catch (exe) {
      activityIndicator = false;

      Fluttertoast.showToast(
        msg: exe.message.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
      notifyListeners();
    }
  }
}
