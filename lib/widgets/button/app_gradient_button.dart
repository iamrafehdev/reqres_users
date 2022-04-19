import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double textSize;
  final Color textColor;
  final Gradient btnGradientColor;
  final double btnHeight;
  final double btnWidth;
  final double borderRadius;

  const AppGradientButton(
      {Key? key,
      this.text = '',
      this.onTap,
      this.textSize = 24.0,
      this.textColor = Colors.white,
      this.btnHeight = 44.0,
      this.btnWidth = 200.0,
      this.borderRadius = 25.0,
      required this.btnGradientColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: btnGradientColor,
        ),
        height: btnHeight,
        width: btnWidth,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
