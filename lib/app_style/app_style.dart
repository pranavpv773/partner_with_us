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
  static Color buttonColor = Colors.amber;
  static Color primary1 = const Color.fromARGB(223, 57, 64, 112);
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color kGrey = Colors.grey;
  /*---Colors------*/

  static final sizedBox10 = SizedBox(height: size.height / 15);
  static String registerText =
      "Please provide a valid mobile number. This number will be a registered to send all important communications from Us.";
  static String fssaiText =
      "At this stage kindly provide Valid FSSAI certificate Details, you can also submit FSSAI Acknowledgement Details if recently applied to proceed further.";
}
