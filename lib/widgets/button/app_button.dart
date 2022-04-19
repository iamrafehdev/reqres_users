import 'package:flutter/material.dart';
import 'package:reqres_users/resources/app_theme.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final double width;
  final Color? btnColor;
  final bool disabled;
  final double textSize;

  static Color PrimaryColorVariant = Color(0xFF1565C0);

  const AppButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.width,
    this.disabled = false,
    this.btnColor,
    this.textSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disabled && onPressed != null) onPressed!();
      },
      child: Container(
        height: 40,
        width: width,
        color: disabled
            ? Colors.grey
            : btnColor == null
                ? AppTheme.primaryColor
                : btnColor,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: textSize, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
