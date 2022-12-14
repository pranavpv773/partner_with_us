import 'package:flutter/material.dart';

class AppStyle {
  /*---Keys------*/
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /*---Keys------*/

  /*---Screen------*/
  static final size =
      MediaQuery.of(rootScaffoldMessengerKey.currentState!.context).size;
  static final sizedBox10 = SizedBox(height: size.height / 15);
  /*---Screen------*/

  /*---Colors------*/
  static Color primary = const Color(0xff34cc89);
  static Color buttonColor = Colors.amber;
  static Color primary1 = const Color.fromARGB(223, 57, 64, 112);
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color kGrey = Colors.grey;
  /*---Colors------*/

  /*---Strings------*/
  static String locationText =
      "Before any personal information is collected and shared by the app with the necessary third parties, the collecting and sharing of information should be disclosed to the user and express consent must be obtained.";
  static String registerText =
      "Please provide a valid mobile number. This number will be a registered to send all important communications from Us.";
  static String fssaiText =
      "At this stage kindly provide Valid FSSAI certificate Details, you can also submit FSSAI Acknowledgement Details if recently applied to proceed further.";
  /*---Strings------*/

}
