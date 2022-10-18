import 'package:flutter/material.dart';
import 'package:partner_app/app/fssai/view/fssai_screen.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/restaurant_detail/view_model/restaurant_provider.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';

import 'widgets/checkbox_dropdown.dart';
import 'widgets/dropdown_widget.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        shadowColor: AppStyle.kGrey,
        child: ContainerWidget(
          color: AppStyle.kWhite,
          width: AppStyle.size.width,
          height: AppStyle.size.height,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Restaurant Details",
                    style: AppTextStyles.h2,
                  ),
                ),
                InfoCard(
                  text: AppStyle.registerText,
                ),
                AppStyle.sizedBox10,
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("City"),
                ),
                DropDownWidget(
                  hint: "Cities",
                  list: RestaurantProvider().cities,
                ),
                Visibility(
                  visible: context.watch<RestaurantProvider>().newValue != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Area"),
                      ),
                      DropDownWidget(
                        hint: "Area",
                        list: RestaurantProvider().cities,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Restaurant Name"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Enter Owner Number"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Preffered Languages"),
                ),
                const CheckBoxDropDown(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Owner Name"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Whatsapp Owner Number"),
                ),
                const TextformsWidget(),
                const FssaiSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FssaiSection extends StatelessWidget {
  const FssaiSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isFssai
          ? Column(
              children: [
                Divider(
                  color: AppStyle.buttonColor,
                ),
                const FssaiScreen(),
              ],
            )
          : const ButtonWidget(index: 1);
    });
  }
}
