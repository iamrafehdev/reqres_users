import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final double btnSize;
  final double iconSize;
  final bool disabled;
  final Color color;

  final IconData icon;
  final Color iconColor;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    this.disabled = false,
    this.btnSize =  40,
    this.iconSize = 26,
    this.color = Colors.blue,
    this.icon = Icons.arrow_forward_outlined,
    this.iconColor = Colors.white,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: btnSize,
      minWidth: btnSize,
      color: disabled ? Colors.grey : color,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,

      ),
      shape: CircleBorder(),
      onPressed: () {
        onPressed();
      },
    );
  }
}
