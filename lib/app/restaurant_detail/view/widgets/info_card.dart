import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerWidget(
        radius: const BorderRadius.all(Radius.circular(8)),
        color: AppStyle.primary1,
        width: AppStyle.size.width / 1,
        height: AppStyle.size.height / 12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: AppTextStyles.h4,
          ),
        ),
      ),
    );
  }
}
