import 'package:flutter/material.dart';

class AppFullWidthDropDown<T> extends StatelessWidget {
  final String? hint;
  final List<T>? items;
  final Function(T?)? onChange;
  final T? value;
  final TextStyle? valuesStyle;
  final bool disable;

  const AppFullWidthDropDown({
    Key? key,
    this.hint,
    this.items,
    this.onChange,
    this.value,
    this.valuesStyle,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: disable ? Colors.grey.shade400 : Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          padding: EdgeInsets.all(5.0),
          alignedDropdown: true,
          child: DropdownButton<T>(
            isExpanded: true,
            hint: Text(hint ?? ""),
            value: value,
            items: items!.map((i) {
              return DropdownMenuItem(child: Text(i.toString(), style: valuesStyle), value: i);
            }).toList(),
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}