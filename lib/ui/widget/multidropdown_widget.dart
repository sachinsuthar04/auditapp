import 'package:auditapp/model/filter_models.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class MultiDropDownWidget extends StatefulWidget {
  final double? height;
  final MultiSelectController<User> controller;
  final void Function(List<ValueItem<User>>) selectedData;
  final String hint;
  final List<ValueItem<User>>? optionItem;

  const MultiDropDownWidget({
    super.key,
    this.height = 50,
    required this.controller,
    required this.selectedData,
    required this.hint,
    this.optionItem = const [],
  });

  @override
  State<MultiDropDownWidget> createState() => _MultiDropDownWidgetState();
}

class _MultiDropDownWidgetState extends State<MultiDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hint.split("Select").last,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontSize: 16,
              ),
        ),
        MultiSelectDropDown<User>(
          controller: widget.controller,
          clearIcon: const Icon(Icons.reddit),
          onOptionSelected: (options) {
            widget.selectedData(options);
          },
          options: widget.optionItem ?? [],
          singleSelectItemStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          chipConfig: const ChipConfig(
              wrapType: WrapType.wrap, backgroundColor: Colors.green),
          optionTextStyle: const TextStyle(fontSize: 16),
          selectedOptionIcon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          selectedOptionBackgroundColor: Colors.grey.shade300,
          selectedOptionTextColor: Colors.blue,
          dropdownMargin: 2,
          onOptionRemoved: (index, option) {
            // widget.selectedData(option);
          },
          optionBuilder: (context, valueItem, isSelected) {
            return ListTile(
              title: Text(valueItem.label),
              subtitle: Text(valueItem.value.toString()),
              trailing: isSelected
                  ? const Icon(Icons.check_circle)
                  : const Icon(Icons.radio_button_unchecked),
            );
          },
        ),
      ],
    );
  }
}
