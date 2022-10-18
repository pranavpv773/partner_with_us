import 'dart:developer';

import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
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
}
