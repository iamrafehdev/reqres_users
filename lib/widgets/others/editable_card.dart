import 'package:flutter/material.dart';
import 'package:reqres_users/widgets/others/sized_boxes.dart';

class AppEditAbleCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function onUpdate;
  final String hintText;
  final TextEditingController  controller;

  const AppEditAbleCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onUpdate,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _AppEditAbleCardState createState() => _AppEditAbleCardState();
}

class _AppEditAbleCardState extends State<AppEditAbleCard> {
  bool edit = true;
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
   //   height: 50,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          if (edit == true) ...[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: ListTile(
                leading: Icon(
                  widget.icon,
                  size: 20,
                ),
                title: Text(widget.text),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      edit = false;
                      changed = true;
                    });
                  },
                ),
              ),
            ),

          SizeBoxHeight16(),
          ],
          if (changed == true) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
               //     prefix: Icon(Icons.person),
                    suffixIcon: IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Icon(Icons.check, color: Colors.blue,),
                      ),
                      onPressed: () {
                        widget.onUpdate();
                       setState(() {
                         edit = true;
                         changed = false;
                       });
                      },
                    ),
                  ),
                ),
              ),
            )
         ]
         ],
      ),
    );
  }
}

// switchButton card with text

class AppSwitchCard extends StatefulWidget {
  final String text;
  final Function onChange;
  final bool value;

  const AppSwitchCard({
    Key? key,

    required this.text,
    required this.onChange,
     this.value = true,

  }) : super(key: key);

  @override
  _AppSwitchCardState createState() => _AppSwitchCardState();
}

class _AppSwitchCardState extends State<AppSwitchCard> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ListTile(

              title: Text(widget.text),
              //trailing:
              // CupertinoSwitchButton(
              //   value: widget.value,
              //   onChange: widget.onChange(),
              // ),
            ),
          ),

      ],
    );
  }
}


