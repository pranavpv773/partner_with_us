// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:partner_app/app/pan_details/view_model/pan_provider.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PanDetail extends StatelessWidget {
  const PanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isPan
          ? Form(
              key: context.read<PanProvider>().panFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pan Details",
                      style: AppTextStyles.h2,
                    ),
                  ),
                  InfoCard(
                    text: AppStyle.fssaiText,
                  ),
                  AppStyle.sizedBox10,
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Pan Number"),
                  ),
                  TextformsWidget(
                    controller: context.read<PanProvider>().panNumber,
                    type: TextInputType.number,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Full Name"),
                  ),
                  TextformsWidget(controller: context.read<PanProvider>().name),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Dob"),
                  ),
                  TextformsWidget(
                    controller: context.read<PanProvider>().dob,
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

                      context.read<PanProvider>().dob.text = now;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Mobile Number"),
                  ),
                  TextformsWidget(
                    controller: context.read<PanProvider>().mobileNumber,
                    type: TextInputType.number,
                  ),
                  value.isBank
                      ? Divider(
                          color: AppStyle.buttonColor,
                        )
                      : ButtonWidget(
                          index: 4,
                          fn: () =>
                              context.read<PanProvider>().buttonFn(context),
                        ),
                ],
              ),
            )
          : const SizedBox();
    });
  }
}
