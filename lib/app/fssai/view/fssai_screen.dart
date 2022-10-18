import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app_style/app_style.dart';

class FssaiScreen extends StatelessWidget {
  const FssaiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      color: AppStyle.primary,
      height: AppStyle.size.height,
      width: AppStyle.size.width,
      child: Container(),
    );
  }
}
