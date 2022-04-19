import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CupertinoSwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;

  const CupertinoSwitchButton({Key? key,
    required this.value,
    required this.onChange})
  : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Transform.scale(
      scale: 0.9,
      child: CupertinoSwitch(
        trackColor: Colors.blueGrey,
        value: value,
        onChanged: onChange,
      ),
    );
  }
}
