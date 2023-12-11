import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Gap.verticalSpace(4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: AppColors.whiteColor,
                  size: 23,
                )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: 87.h,
        width: double.infinity,
        // color: AppColors.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                        'Login activity',
                        style: CustomTextStyles.heading(
                            size: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("Your Overall login activity in here.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff848484))),
                      Gap.verticalSpace(2.h),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return ListTile(
                            // minLeadingWidth: 100,
                            leading: SvgPicture.asset(
                              'assets/Icons/iphone.svg',
                            ),
                            title: Text("IPhone",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                            subtitle: Text("sep 30, 2023",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff848484),
                                  fontWeight: FontWeight.w400,
                                )),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icons/delete_icon.svg',
                                  width: 5.w,
                                ),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Text("Signed In Via IOS",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xff848484),
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          );
                        },
                        itemCount: 1,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
