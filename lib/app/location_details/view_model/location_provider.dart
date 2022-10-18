import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:provider/provider.dart';

class LocationProvider with ChangeNotifier {
  final name = TextEditingController();

  final email = TextEditingController();
  final zip = TextEditingController();
  final locationFormKey = GlobalKey<FormState>();

  buttonFn(BuildContext context) {
    if (locationFormKey.currentState!.validate()) {
      context.read<FormProvider>().onTabisPan(3);
    }
  }
}
