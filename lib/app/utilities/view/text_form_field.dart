// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:partner_app/app_style/app_style.dart';

class TextformsWidget extends StatelessWidget {
  const TextformsWidget(
      {Key? key, this.type, this.suffix, this.function, this.controller})
      : super(key: key);
  final TextInputType? type;
  final Widget? suffix;
  final void Function()? function;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return " Please fill this field";
          }
        },
        onTap: function ?? () {},
        keyboardType: type ?? TextInputType.name,
        controller: controller,
        style: TextStyle(
          color: AppStyle.kGrey,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          // helperText: controller!.text ?? "",
          contentPadding: const EdgeInsets.all(0),
          fillColor: AppStyle.kWhite,
          filled: true,
          prefixIcon: const Icon(Icons.food_bank_rounded),
          suffixIcon: suffix ?? const SizedBox(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: AppStyle.primary,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
