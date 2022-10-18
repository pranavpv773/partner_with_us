import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 10,
          shadowColor: AppStyle.kGrey,
          child: ContainerWidget(
            color: Colors.white,
            width: AppStyle.size.width,
            height: AppStyle.size.height,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContainerWidget(
                    color: AppStyle.primary1,
                    width: AppStyle.size.width / 1,
                    height: AppStyle.size.height / 11,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please provide a valid mobile number. This number will be a registered to send all important communications from Us",
                        style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppStyle.kWhite,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
