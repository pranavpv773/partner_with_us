import 'package:flutter/material.dart';
import 'package:partner_app/app_style/app_style.dart';

class AppTextStyles {
  static TextStyle h1 = const TextStyle(
    letterSpacing: 1.5,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static TextStyle h2 = TextStyle(
    letterSpacing: 1,
    color: AppStyle.kBlack,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static TextStyle h3 = TextStyle(
    overflow: TextOverflow.ellipsis,
    letterSpacing: 0.2,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    color: AppStyle.kBlack,
    fontSize: 12,
  );

  static TextStyle h4 = TextStyle(
    wordSpacing: 2,
    letterSpacing: 1,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppStyle.kWhite,
  );

  static TextStyle h5 = TextStyle(
    fontSize: 8,
    color: AppStyle.kBlack,
    fontWeight: FontWeight.w500,
  );
}
