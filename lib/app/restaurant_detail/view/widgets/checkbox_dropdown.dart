import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:partner_app/app_style/app_style.dart';

class CheckBoxDropDown extends StatelessWidget {
  CheckBoxDropDown({Key? key}) : super(key: key);

  final List<String> items = [
    'English',
    'Hindi',
    'Telugu',
    'Kannada',
  ];
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
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
          hint: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              'Select Items',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      isSelected
                          ? selectedItems.remove(item)
                          : selectedItems.add(item);
                      //This rebuilds the StatefulWidget to update the button's text
                      // setState(() {});
                      //This rebuilds the dropdownMenu Widget to update the check mark
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          isSelected
                              ? const Icon(Icons.check_box_outlined)
                              : const Icon(Icons.check_box_outline_blank),
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
                  );
                },
              ),
            );
          }).toList(),
          //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
          value: selectedItems.isEmpty ? null : selectedItems.last,
          onChanged: (value) {},
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          itemPadding: EdgeInsets.zero,
          selectedItemBuilder: (context) {
            return items.map(
              (item) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    selectedItems.join(', '),
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
      ),
    );
  }
}
