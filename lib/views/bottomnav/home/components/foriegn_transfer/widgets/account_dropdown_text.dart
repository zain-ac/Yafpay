import 'package:flutter/material.dart';

class AccountDropdownText extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight fontWeight;
  AccountDropdownText({
    required this.color,
    required this.text,
    this.size = 12,
    this.fontWeight = FontWeight.w500,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        // fontFamily: "Nunito",
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: TextAlign.right,
    );
  }
}
