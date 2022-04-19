import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VirtualAssistant extends StatelessWidget {
  final String text;

  final bool bold;
  final Color? color;
  final bool justifyText;
  final String image;

  const VirtualAssistant(
      {Key? key,
      required this.text,

      this.bold = false,
      this.color,
      this.justifyText = false,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("$image"),
              backgroundColor: Colors.transparent,
            ),
            Text(
              text,
              textAlign: justifyText ? TextAlign.justify : null,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
