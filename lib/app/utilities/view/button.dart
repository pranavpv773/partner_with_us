import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.screen,
    required this.index,
  }) : super(key: key);

  final dynamic screen;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: AppStyle.buttonColor,
          ),
          height: 30.0,
          child: TextButton(
            child: Center(
              child: Text(
                "Process",
                style: TextStyle(fontSize: 15, color: AppStyle.kWhite),
              ),
            ),
            onPressed: () {
              context.read<FormProvider>().onTabIndexChange(index);
            },
          )),
    );
  }
}
