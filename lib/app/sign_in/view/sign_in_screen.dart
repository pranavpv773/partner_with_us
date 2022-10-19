import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app/sign_in/view_model/sign_in_provider.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_images.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWidget(
        width: AppStyle.size.width,
        height: AppStyle.size.height,
        color: AppStyle.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: context.read<SignInProvider>().signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.login,
                  // width: AppStyle.size.width / 3,
                ),
                TextformsWidget(
                  hintText: "Username",
                  controller: context.read<SignInProvider>().userName,
                  iconData: Icons.person,
                ),
                TextformsWidget(
                  hintText: "Password",
                  controller: context.read<SignInProvider>().password,
                  iconData: Icons.remove_red_eye,
                ),
                const SignInButton(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // context.watch()
                      GestureDetector(
                        onTap: () {
                          log("message");
                          context.read<SignInProvider>().googleLogIn();
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(AppImages.google),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<SignInProvider>().buttonFn(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppStyle.kBlack),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: AppStyle.size.width / 3)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      child: Text(
        'Sign In',
        style: TextStyle(color: AppStyle.kWhite),
      ),
    );
  }
}
