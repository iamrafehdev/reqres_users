import 'package:flutter/material.dart';

class Dialogs {
  static infoDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(msg, style: TextStyle()),
        //  title: Icon(Icons.info_outline, color: Colors.yellow[800], size: 60),
          actions: <Widget>[
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: MaterialButton(
                      //       color: Colors.red,
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(4.0),
                      //         child: Text(
                      //           "OK",
                      //           style: TextStyle(color: Colors.white, fontSize: 18),
                      //         ),
                      //       ),
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       }),
                      // ),
                    ],
                  )),
            )
          ],
        );
      },
    );
  }
}