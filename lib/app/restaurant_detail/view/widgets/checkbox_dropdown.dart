import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/app/restaurant_detail/view_model/restaurant_provider.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:provider/provider.dart';

class CheckBoxDropDown extends StatelessWidget {
  const CheckBoxDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Consumer<RestaurantProvider>(builder: (context, value, _) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select Items',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                items: value.items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    enabled: false,
                    child: InkWell(
                      onTap: () {
                        value.selectCheckValue(item);
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            value.iconCheck(item),
                            const SizedBox(width: 16),
                            Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                value: value.selectedItems.isEmpty
                    ? null
                    : value.selectedItems.last,
                onChanged: (value) {},
                buttonHeight: 40,
                buttonWidth: 140,
                itemHeight: 40,
                itemPadding: EdgeInsets.zero,
                selectedItemBuilder: (context) {
                  return value.items.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          value.selectedItems.join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
              ),
            );
          }),
        ));
  }
}
