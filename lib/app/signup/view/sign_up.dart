import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app/signup/view_model/sign_up_provider.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_images.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
            key: context.read<SignUpProvider>().signUpFormKey,
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
                  controller: context.read<SignUpProvider>().userName,
                  iconData: Icons.person,
                ),
                TextformsWidget(
                  hintText: "Password",
                  controller: context.read<SignUpProvider>().password,
                  iconData: Icons.remove_red_eye,
                ),
                TextformsWidget(
                  hintText: "Confirm Password",
                  controller: context.read<SignUpProvider>().conformpassword,
                  iconData: Icons.remove_red_eye,
                ),
                const SignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, value, _) {
      return ElevatedButton(
        onPressed: () {
          value.signupIndicator
              ? () {}
              : context.read<SignUpProvider>().buttonFn(context);
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
          value.signupIndicator ? "" : 'Sign Up',
          style: TextStyle(color: AppStyle.kWhite),
        ),
      );
    });
  }
}
