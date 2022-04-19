import 'package:flutter/material.dart';

class AppIconField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FocusNode? focusNode;
  final String? initialValue;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final InputDecoration decoration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool autocorrect;
  final bool maxLengthEnforced;
  final bool showEmailIcon;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? isEnabled;
  final TextInputType keyboardType;

  AppIconField(
      {Key? key,
      required this.controller,
      this.initialValue,
      this.focusNode,
      this.decoration = const InputDecoration(),
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction,
      this.style,
      this.textDirection,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.autofocus = false,
      this.readOnly = false,
      this.showCursor,
      this.autocorrect = true,
      this.maxLengthEnforced = true,
      this.showEmailIcon = true,
      this.maxLines = 1,
      this.minLines,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.validator,
      required this.label,
      this.prefixIcon = Icons.alternate_email,
      this.suffixIcon,
      this.isEnabled = true,
      this.keyboardType = TextInputType.emailAddress});

  get doc => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        style: style,
        textDirection: textDirection,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        autofocus: autofocus,
        readOnly: readOnly,
        showCursor: showCursor,
        autocorrect: autocorrect,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        decoration: InputDecoration(
            enabled: isEnabled!,
            fillColor: isEnabled == false ? Colors.grey[300] : Colors.white24,
            filled: true,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            // border: OutlineInputBorder(),
            labelText: label),
      ),
    );
  }
}
