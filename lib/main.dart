import 'package:flutter/material.dart';
import 'package:partner_app/app/bank_details/view_model/bank_provider.dart';
import 'package:partner_app/app/fssai/view_model/fssai_provider.dart';
import 'package:partner_app/app/location_details/view_model/location_provider.dart';
import 'package:partner_app/app/pan_details/view_model/pan_provider.dart';
import 'package:partner_app/app/partner_form/view/form_screen.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view_model/restaurant_provider.dart';
import 'package:partner_app/app/splash/view_model/splash_provider.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => FormProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => FssaiProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => PanProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => BankProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRoutes.navigatorKey,
        scaffoldMessengerKey: AppStyle.rootScaffoldMessengerKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FormScreen(),
      ),
    );
  }
}
