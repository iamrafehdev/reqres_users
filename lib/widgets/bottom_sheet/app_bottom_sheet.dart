import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reqres_users/config/funx/functions/extensions.dart';

class AppCupertinoBottomSheet extends StatefulWidget {
  final String? title;
  final bool isTitle;
  final List<CupertinoActionSheetAction>? actionList;

  const AppCupertinoBottomSheet({
    Key? key,
    this.actionList,
    this.title,
    this.isTitle = false,
  }) : super(key: key);

  @override
  _AppCupertinoBottomSheetState createState() =>
      _AppCupertinoBottomSheetState();
}

class _AppCupertinoBottomSheetState extends State<AppCupertinoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: widget.isTitle == true
          ? Text(
              widget.title!,
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            )
          : null,
      actions: widget.actionList,
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          'Cancel',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          pop();
        },
      ),
    );
  }
}

class AppBottomSheet {
  static appMaterialBottomSheet(BuildContext context,
      {required List<Widget> list}) {
    showModalBottomSheet(
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: list,
          );
        });
  }
}
