import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';

class PanDetail extends StatelessWidget {
  const PanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isPan
          ? Column(
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
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Full Name"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Dob"),
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
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Mobile Number"),
                ),
                const TextformsWidget(),
                value.isBank
                    ? Divider(
                        color: AppStyle.buttonColor,
                      )
                    : ButtonWidget(
                        index: 4,
                        fn: () => context.read<FormProvider>().onTabisBank(4),
                      ),
              ],
            )
          : const SizedBox();
    });
  }
}