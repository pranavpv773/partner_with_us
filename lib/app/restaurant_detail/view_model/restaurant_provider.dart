import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:provider/provider.dart';

class RestaurantProvider with ChangeNotifier {
  final city = TextEditingController();
  final area = TextEditingController();
  final resName = TextEditingController();
  final ownerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final whatsappnumber = TextEditingController();
  String? newValue;
  String? newCity;
  bool isSelected = false;
  String? newArea;
  final TextEditingController textEditingController = TextEditingController();
  final List<String> items = [
    'English',
    'Hindi',
    'Telugu',
    'Kannada',
  ];
  List<String> selectedItems = [];
  final List cities = [
    " Alipur",
    "Andaman Island",
    "Anderson Island",
    "Arainj-Laka-Punga",
    "Austinabad",
    "Bamboo Flat",
    "Barren Island",
    "Kochi",
    "Hyderbad",
    "Banglore",
    "Delhi",
    "Calicut"
  ];
  void selectValue(String value) {
    newValue = value;
    log(newValue.toString());
    log("message");
    notifyListeners();
  }

  Icon iconCheck(String item) {
    if (selectedItems.contains(item)) {
      return const Icon(Icons.check_box_outlined);
    } else {
      return const Icon(Icons.check_box_outline_blank);
    }
  }

  void selectCheckValue(String item) {
    if (selectedItems.contains(item)) {
      isSelected = true;
      selectedItems.remove(item);
      notifyListeners();
    } else {
      isSelected = false;
      selectedItems.add(item);
      notifyListeners();
    }

    log("message");
    notifyListeners();
  }

  buttonFn(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<FormProvider>().onTabIndexFirstChange(1);
    }
  }
}
