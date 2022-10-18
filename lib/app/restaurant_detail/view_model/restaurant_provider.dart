import 'dart:developer';

import 'package:flutter/widgets.dart';

class RestaurantProvider with ChangeNotifier {
  String? newValue;
  String? newCity;
  String? newArea;
  final TextEditingController textEditingController = TextEditingController();
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
}
