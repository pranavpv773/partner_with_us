import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:provider/provider.dart';

class PanProvider with ChangeNotifier {
  final dob = TextEditingController();
  final mobileNumber = TextEditingController();
  final name = TextEditingController();
  final panNumber = TextEditingController();
  final panFormKey = GlobalKey<FormState>();

  buttonFn(BuildContext context) {
    if (panFormKey.currentState!.validate()) {
      context.read<FormProvider>().onTabisLocation(2);
    }
  }
}
