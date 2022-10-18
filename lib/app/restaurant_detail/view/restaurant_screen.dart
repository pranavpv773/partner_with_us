import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/container_widget.dart';
import 'package:partner_app/app/restaurant_detail/view/widgets/info_card.dart';
import 'package:partner_app/app/restaurant_detail/view_model/restaurant_provider.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';

import 'widgets/checkbox_dropdown.dart';

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
                const InfoCard(),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Restaurant Name"),
                      ),
                      const TextformsWidget(),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Enter Owner NUmber"),
                      ),
                      const TextformsWidget(),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Preffered Languages"),
                      ),
                      CheckBoxDropDown(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.hint,
    required this.list,
    this.title,
  }) : super(key: key);
  final List list;
  final String hint;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, value, _) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: AppStyle.kGrey,
                  width: 1,
                )),
            width: AppStyle.size.width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value.newValue ?? hint,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                items: list
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                value: title ?? value.newValue,
                onChanged: (value) {
                  context.read<RestaurantProvider>().selectValue(
                        value.toString(),
                      );
                },
                buttonHeight: 40,
                buttonWidth: 200,
                itemHeight: 40,
                dropdownMaxHeight: 200,
                searchController: value.textEditingController,
                searchInnerWidget: const Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextformsWidget(
                      suffix: Icon(Icons.search),
                    )),
                searchMatchFn: (item, searchValue) {
                  return (item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()));
                },
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    value.textEditingController.clear();
                  }
                },
              ),
            ),
          ));
    });
  }
}
