import 'package:flutter/material.dart';
import 'package:partner_app/app_style/app_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.text,
    this.index,
    this.colors,
    required this.fn,
  }) : super(key: key);

  final String? text;
  final int? index;
  final Color? colors;

  final VoidCallback fn;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: colors ?? AppStyle.buttonColor,
          ),
          height: 30.0,
          child: TextButton(
              onPressed: fn,
              child: Center(
                child: Text(
                  text ?? "Process",
                  style: TextStyle(fontSize: 15, color: AppStyle.kWhite),
                ),
              ))),
    );
  }
}
