import 'package:flutter/material.dart';

class AppStyle {
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final size =
      MediaQuery.of(rootScaffoldMessengerKey.currentState!.context).size;
}
