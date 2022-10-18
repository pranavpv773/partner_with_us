import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:provider/provider.dart';

class BankProvider with ChangeNotifier {
  final code = TextEditingController();
  final bank = TextEditingController();
  final branch = TextEditingController();
  final accountNumber = TextEditingController();
  final bankFormKey = GlobalKey<FormState>();

  buttonFn(BuildContext context) {
    if (bankFormKey.currentState!.validate()) {
      context.read<FormProvider>().onTabisLocation(4);
    }
  }
}
