import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/app_colors.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';

class EnableSecurityApp extends StatefulWidget {
  const EnableSecurityApp({super.key});

  @override
  State<EnableSecurityApp> createState() => _EnableSecurityAppState();
}

class _EnableSecurityAppState extends State<EnableSecurityApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 6.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                  ),
                )),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text("Enable Security App",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          SizedBox(
            height: 5.px,
          ),
          Text(
              "To unable 2FA, you will have to install an \nauthenticator app on your phone, and scan QR\n code below",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              )),
          SizedBox(
            height: 10.h,
          ),
          SvgPicture.asset('assets/Icons/qr.svg'),
          SizedBox(
            height: 13.h,
          ),
          Text("Can’t scan the QR code? configure your app with\nthis key",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          SizedBox(
            height: 13.px,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Y453356/85690HJAFH5689JAJGDSEJO7",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset('assets/Icons/copy_.svg',color: Color(0xff36BC6C),)
            ],
          ),
          Spacer(),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            // margin: EdgeInsets.only(
            //     bottom: 4.h
            // ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {},
                child: Text("Continue",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ),
          SizedBox(
            height: 3.h,
          ),

        ],
      ),
    );
  }
}
