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
  static Color primary1 = const Color.fromARGB(224, 78, 88, 151);
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color kGrey = Colors.grey;
  /*---Colors------*/
}
