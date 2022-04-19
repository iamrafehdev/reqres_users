import 'package:flutter/material.dart';

class AppDropDownWithLabel<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final List<T> items;
  final Function onChange;
  final Function()? validator;
  final T? value;
  final bool? applyValidation;
  final String? errorMessage;

  AppDropDownWithLabel({
    Key? key,
    this.label,
    this.hint,
    required this.items,
    this.value,
    required this.onChange,
    this.validator,
    this.applyValidation = false,
    this.errorMessage = "Required!",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: (value == null && applyValidation!) ? Colors.red : Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(label ?? ""),
              ),
              Expanded(
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      padding: EdgeInsets.all(5.0),
                      alignedDropdown: true,
                      child: DropdownButton<T>(
                        isExpanded: true,
                        hint: Text(hint ?? ""),
                        value: value,
                        items: items != null
                            ? items.map((i) {
                                return DropdownMenuItem(child: Text(i.toString()), value: i);
                              }).toList()
                            : null,
                        onChanged: (item) {
                          if (onChange != null) onChange(item);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (value == null && applyValidation!)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 4.0),
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
