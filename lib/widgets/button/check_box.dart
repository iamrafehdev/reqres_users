import 'package:flutter/material.dart';
import 'package:reqres_users/widgets/others/app_text.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final String text;
  final Function(bool?) onChanged;
  final Function()? onTap;

  const AppCheckBox({
    Key? key,
    required this.value,
    required this.text,
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            //   mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: value,
                      onChanged: onChanged,
                    )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: AppText(
                    text,
                    color: Colors.black,
                    size: 14,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
