import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';

import '../../../auth/data/models/city_data_model.dart';

class FiltersButton extends StatefulWidget {
  final List<String> items;

  const FiltersButton({
    super.key,
    required this.items,
  });

  @override
  State<FiltersButton> createState() => _FiltersButtonState();
}

class _FiltersButtonState extends State<FiltersButton> {
  var selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'المنطقة',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.greenColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.greenColor,
          ),
        ),
        items: widget.items.map((item) {
          return DropdownMenuItem(
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
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (isSelected)
                          const Icon(Icons.check_box_outlined)
                        else
                          const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
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
        selectedItemBuilder: (context) {
          return widget.items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
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
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 14),
          height: 40,
          width: 0.3.width,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(
              width: 1.4,
              color: AppColors.greenColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 44,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
