import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/views/new_updated_views/enable_security_app.dart';
import 'package:sample/views/new_updated_views/enable_text_message.dart';
import 'package:sample/views/new_updated_views/two_factor_auth_pin.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';

class TwoFactorScreens extends StatefulWidget {
  const TwoFactorScreens({super.key});

  @override
  State<TwoFactorScreens> createState() => _TwoFactorScreensState();
}

class _TwoFactorScreensState extends State<TwoFactorScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Gap.verticalSpace(8.h),
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
                          )
                      ),
                    ),
                    Gap.verticalSpace(30.99.px),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.px),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap.verticalSpace(20.px),
                                Row(
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Two factor authentication',
                                      style: CustomTextStyles.headingStyle(),
                                    ),
                                  ],
                                ),
                                Gap.verticalSpace(5.px),
                                Text("Select Your Preferred Method",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff848484),
                                      fontWeight: FontWeight.w400,
                                    )),
                                Gap.verticalSpace(30.px),

                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("SMS",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Gap.verticalSpace(5.px),
                                        Container(
                                          width: 80.w,
                                          child: Text(
                                              "You will receive verification codes via text message whenever you perform a transaction.",
                                              style: TextStyle(
                                                color: Color(0xff848484),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap:() {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>EnableTextMessages()));
                                      },
                                      child: SvgPicture.asset(
                                          'assets/Icons/next-arrow.svg'),
                                    ),
                                  ],
                                ),
                                Gap.verticalSpace(20.px),
                                GestureDetector(
                                  onTap: () {
                                   // Navigator.push(context, MaterialPageRoute(builder: (_)=>));
                                  },
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Security App",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Gap.verticalSpace(5.px),
                                          Container(
                                            width: 80.w,
                                            child: Text(
                                                "You’ll use a verification code generated by a secure app like Duo Mobile or Google Authenticator. ",
                                                style: TextStyle(
                                                  color: Color(0xff848484),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap:  () {
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>EnableSecurityApp()));
                                        },
                                        child: SvgPicture.asset(
                                            'assets/Icons/next-arrow.svg'),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap.verticalSpace(50.h),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
