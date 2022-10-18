import 'package:flutter/material.dart';

class AppStyle {
  /*---Keys------*/
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final size =
      MediaQuery.of(rootScaffoldMessengerKey.currentState!.context).size;
  /*---Keys------*/

  /*---Colors------*/
  static Color primary = const Color(0xff34cc89);

  /*---Colors------*/
}
