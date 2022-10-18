import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/utilities/view/button.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dateCtl = TextEditingController();
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isBank
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Bank Details",
                    style: AppTextStyles.h2,
                  ),
                ),
                InfoCard(
                  text: AppStyle.fssaiText,
                ),
                AppStyle.sizedBox10,
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Bank Name"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Branch Name"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Account Number"),
                ),
                const TextformsWidget(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("IFSC Code"),
                ),
                const TextformsWidget(),
                value.isBank
                    ? ButtonWidget(
                        index: 4,
                        fn: () {
                          context.read<FormProvider>().onTabisLocation(4);
                        },
                      )
                    : Divider(
                        color: AppStyle.buttonColor,
                      )
              ],
            )
          : const SizedBox();
    });
  }
}
