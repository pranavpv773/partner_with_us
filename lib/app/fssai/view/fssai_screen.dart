import 'package:flutter/material.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';

class FssaiScreen extends StatelessWidget {
  const FssaiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dateCtl = TextEditingController();
    return Column(
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
          suffix: const Icon(Icons.date_range_outlined),
          function: () async {
            DateTime date = DateTime(1900);
            FocusScope.of(context).requestFocus(FocusNode());

            date = (await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100)))!;

            dateCtl.text = date.toIso8601String();
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text("Enter FSSAI Register Number"),
        ),
        const TextformsWidget(),
        const ButtonWidget(index: 0)
      ],
    );
  }
}
