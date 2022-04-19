import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final bool bold;
  final Color? color;
  final bool justifyText;

  const AppText(
    this.text, {
    Key? key,
    this.size = 18,
    this.bold = false,
    this.color,
    this.justifyText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: justifyText ? TextAlign.justify : null,
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: color,
        fontSize: size,
      ),
    );
  }
}

class AppTextWithInfoIcon extends StatelessWidget {
  final String text;
  final double size;
  final bool bold;
  final Color color;
  final Widget infoIcon;

  const AppTextWithInfoIcon(
    this.text, {
    Key? key,
    this.size = 18,
    this.bold = false,
    required this.color,
    required this.infoIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: color,
              fontSize: size,
            ),
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: infoIcon ,
            ),
          ),
        ],
      ),
    );
  }
}

class RequiredText extends StatelessWidget {
  final String labelText;
  final String requiredSign;
  final double labelTextScale;
  final int labelMaxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final Color labelColor;
//  final FontWeight fontWeight;
  final double fontSize;

  const RequiredText(
    this.labelText, {
    Key? key,
    this.requiredSign = ' *',
    this.labelColor = Colors.black54,
   // this.fontWeight,
    required this.fontSize,
    this.labelMaxLines = 1,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.labelTextScale = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8, right: 8),
      child: RichText(
        text: TextSpan(
            text: labelText,
            style: TextStyle(
              color: labelColor,
              fontSize: fontSize,
            ),
            children: [
              TextSpan(
                  text: requiredSign,
                  style: TextStyle(
                      color: Colors.red,
                    //  fontWeight: fontWeight,
                      fontSize: fontSize))
            ]),
        textScaleFactor: labelTextScale,
        maxLines: labelMaxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
