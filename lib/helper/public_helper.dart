import 'package:flutter/cupertino.dart';
import 'package:svg_flutter/svg.dart';

class PublicHelper{
  @override
  Widget backButton({ VoidCallback? onTap = null ,bool back = false,required BuildContext context}){
    return  GestureDetector(
      onTap: () {
       back ? Navigator.pop(context):false;
       onTap;
      },
      child: Container(
        alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
              left: 20
          ),
          child: SvgPicture.asset('assets/Icons/back_icon.svg')),
    );
  }
}