import 'package:flutter/widgets.dart';
import 'package:partner_app/app/restaurant_detail/view/restaurant_screen.dart';

class FormProvider with ChangeNotifier {
  int pageIndex = 0;
  final List pages = [const RestaurantDetailScreen()];
}
