import 'package:flutter/material.dart';

class ForgetPasswordLink extends StatelessWidget {
  final String text;
  final Function() onTap;

  const ForgetPasswordLink({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
