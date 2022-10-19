// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:partner_app/app/fssai/view_model/fssai_provider.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FssaiScreen extends StatelessWidget {
  const FssaiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isFssai
          ? Form(
              key: context.read<FssaiProvider>().fssaiFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "FSSAI Details",
                      style: AppTextStyles.h2,
                    ),
                  ),
                  InfoCard(
                    text: AppStyle.fssaiText,
                  ),
                  AppStyle.sizedBox10,
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("FSSAI Expiration Date"),
                  ),
                  TextformsWidget(
                    controller: context.read<FssaiProvider>().date,
                    suffix: const Icon(Icons.date_range_outlined),
                    function: () async {
                      DateTime date = DateTime.now();
                      FocusScope.of(context).requestFocus(FocusNode());

                      DateTime dates = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100)))!;
                      String now = DateFormat('dd-MM-yyyy').format(dates);

                      context.read<FssaiProvider>().date.text = now;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Enter FSSAI Register Number"),
                  ),
                  TextformsWidget(
                    type: TextInputType.number,
                    controller: context.read<FssaiProvider>().registerNumber,
                  ),
                  value.isLocation == false
                      ? ButtonWidget(
                          index: 2,
                          fn: () {
                            context.read<FssaiProvider>().buttonFn(context);
                          },
                        )
                      : Divider(
                          color: AppStyle.buttonColor,
                        )
                ],
              ),
            )
          : const SizedBox();
    });
  }
}
