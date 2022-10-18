import 'package:flutter/material.dart';
import 'package:partner_app/app/bank_details/view_model/bank_provider.dart';
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
    return Consumer<FormProvider>(builder: (context, value, _) {
      return value.isBank
          ? Form(
              key: context.read<BankProvider>().bankFormKey,
              child: Column(
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
                  TextformsWidget(
                    controller: context.read<BankProvider>().bank,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Branch Name"),
                  ),
                  TextformsWidget(
                      controller: context.read<BankProvider>().branch),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Account Number"),
                  ),
                  TextformsWidget(
                    controller: context.read<BankProvider>().accountNumber,
                    type: TextInputType.number,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("IFSC Code"),
                  ),
                  TextformsWidget(
                    controller: context.read<BankProvider>().code,
                    type: TextInputType.number,
                  ),
                  value.isBank
                      ? ButtonWidget(
                          index: 4,
                          fn: () {
                            context.read<BankProvider>().buttonFn(context);
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
