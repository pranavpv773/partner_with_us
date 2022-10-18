import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/form_screen.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
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
        )
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
