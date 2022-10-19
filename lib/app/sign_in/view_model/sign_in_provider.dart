import 'package:flutter/widgets.dart';

class SignInProvider with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  buttonFn(BuildContext context) {
    if (signInFormKey.currentState!.validate()) {}
  }
}
