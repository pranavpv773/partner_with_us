import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:partner_app/app/fssai/view/fssai_screen.dart';
import 'package:partner_app/app/restaurant_detail/view/restaurant_screen.dart';

class FormProvider with ChangeNotifier {
  int pageIndex = 0;
  final List pages = [const RestaurantDetailScreen(), const FssaiScreen()];
  onTabIndexChange(int number) {
    pageIndex = number;
    log(pageIndex.toString());

    notifyListeners();
  }
}
