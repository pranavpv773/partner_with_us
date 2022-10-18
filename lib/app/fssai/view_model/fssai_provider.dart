import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:provider/provider.dart';

class FssaiProvider with ChangeNotifier {
  final date = TextEditingController();

  final registerNumber = TextEditingController();
  final fssaiFormKey = GlobalKey<FormState>();

  buttonFn(BuildContext context) {
    if (fssaiFormKey.currentState!.validate()) {
      context.read<FormProvider>().onTabisLocation(2);
    }
  }
}
