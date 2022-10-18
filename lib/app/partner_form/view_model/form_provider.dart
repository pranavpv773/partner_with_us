import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:partner_app/app/fssai/view/fssai_screen.dart';
import 'package:partner_app/app/restaurant_detail/view/restaurant_screen.dart';

class FormProvider with ChangeNotifier {
  int pageIndex = 0;
  bool isFssai = false;
  bool isPan = false;
  bool isBank = false;

  bool isLocation = false;

  final List pages = [const RestaurantDetailScreen(), const FssaiScreen()];
  onTabIndexFirstChange(int number) {
    pageIndex = number;
    isFssai = true;

    log(isFssai.toString());

    notifyListeners();
  }

  // bool onTabisFssail() {
  //   log(isFssai.toString());

  //   notifyListeners();
  //   return isFssai;
  // }

  onTabisLocation(int number) {
    pageIndex = number;
    isLocation = true;

    log(isLocation.toString());

    notifyListeners();
  }

  onTabisPan(int number) {
    pageIndex = number;
    isPan = true;

    log(isPan.toString());

    notifyListeners();
  }

  onTabisBank(int number) {
    pageIndex = number;
    isBank = true;

    log(isBank.toString());

    notifyListeners();
  }
}
