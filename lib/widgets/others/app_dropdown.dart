import 'package:flutter/material.dart';

class AppDropDown extends StatefulWidget {
  final List list;
  final bool? isDisabled;

  const AppDropDown({Key? key, required this.list, this.isDisabled}) : super(key: key);

  @override
  _AppDropDownState createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
   String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          enabled: widget.isDisabled!,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          contentPadding: EdgeInsets.all(18),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text("Select role"),
            value: selectedValue,
            isDense: true,
            isExpanded: true,
            items: widget.list.map((dynamic value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue.toString();
              });
            },
          ),
        ),
      ),
    );
  }
}
