import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/app/restaurant_detail/view_model/restaurant_provider.dart';
import 'package:partner_app/app/utilities/view/text_form_field.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:provider/provider.dart';

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
                  width: 2,
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
