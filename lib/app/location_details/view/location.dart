import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:partner_app/app/location_details/view_model/location_provider.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("message");
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isLocation
          ? Form(
              key: context.read<LocationProvider>().locationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Location Details",
                      style: AppTextStyles.h2,
                    ),
                  ),
                  InfoCard(
                    text: AppStyle.locationText,
                  ),
                  AppStyle.sizedBox10,
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Owner Name"),
                  ),
                  TextformsWidget(
                    controller: context.read<LocationProvider>().name,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Email"),
                  ),
                  TextformsWidget(
                    controller: context.read<LocationProvider>().email,
                    type: TextInputType.emailAddress,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Zip Code"),
                  ),
                  TextformsWidget(
                    controller: context.read<LocationProvider>().zip,
                    type: TextInputType.number,
                  ),
                  value.isPan == false
                      ? ButtonWidget(
                          index: 3,
                          fn: () {
                            context.read<LocationProvider>().buttonFn(context);
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
