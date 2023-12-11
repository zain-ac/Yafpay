import 'package:flutter/material.dart';

import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class BottomNavTiles extends StatelessWidget {
  Widget img;
  String text1;
  String text2;
  VoidCallback function;
  BottomNavTiles({
    required this.text1,
    required this.function,
    required this.text2,
    required this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      // width: 350,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffDCDCDC)),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: function,
        leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: const Color(0xffF24D4D).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 11, left: 10, right: 9.3, bottom: 13),
              child: img,
            )),
        trailing: const Icon(
          Icons.chevron_right,
        ),
        horizontalTitleGap: 15,
        title: Text(
          text1,
          style: const TextStyle(
            fontFamily: "Nunito",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff142445),
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        subtitle: Text(
          text2,
          style: const TextStyle(
            fontFamily: "Nunito",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff848484),
          ),
        ),
      ),
    );
  }
}
