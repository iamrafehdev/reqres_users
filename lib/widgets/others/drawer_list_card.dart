import 'package:flutter/material.dart';
import 'package:reqres_users/resources/app_theme.dart';
import 'package:reqres_users/widgets/others/app_text.dart';

class DrawerListCard extends StatefulWidget {
  final String text;
  final IconData prefixIcon;
  final List<ListTile>? subTiles;

  const DrawerListCard(
      {Key? key, this.text = 'User', this.prefixIcon = Icons.person, this.subTiles})
      : super(key: key);

  @override
  State<DrawerListCard> createState() => _DrawerListCardState();
}

class _DrawerListCardState extends State<DrawerListCard> {
  bool isExpended = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: Icon(widget.prefixIcon,
                  color: isExpended ? Colors.white : Colors.grey),
              title: AppText(widget.text,
                  size: 16.0, color: isExpended ? Colors.white : Colors.grey),
              trailing: isExpended
                  ? Icon(Icons.keyboard_arrow_down,
                      color: isExpended ? Colors.white : Colors.grey)
                  : Icon(Icons.keyboard_arrow_right,
                      color: isExpended ? Colors.white : Colors.grey),
              onTap: () {
                isExpended = !isExpended;
                setState(() {});
                print(isExpended);
              },
            ),
            decoration: BoxDecoration(
              gradient: isExpended
                  ? AppTheme.blueGradientLeft
                  : AppTheme.whiteGradient,
            ),
          ),
          if (isExpended == true && widget.subTiles != null) ...widget.subTiles!,
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
