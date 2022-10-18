import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app_style/app_style.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerWidget(
        radius: const BorderRadius.all(Radius.circular(8)),
        color: AppStyle.primary1,
        width: AppStyle.size.width / 1,
        height: AppStyle.size.height / 13,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Please provide a valid mobile number. This number will be a registered to send all important communications from Us.",
            style: TextStyle(
              wordSpacing: 2,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppStyle.kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
