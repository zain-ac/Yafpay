import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../helper/gap.dart';
import '../utils/app_Images.dart';
import '../utils/app_colors.dart';
import '../utils/custom_text_styles.dart';

class CardSetting extends StatefulWidget {
  const CardSetting({super.key});

  @override
  State<CardSetting> createState() => _CardSettingState();
}

class _CardSettingState extends State<CardSetting> {
  bool switchVal = false;

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
                          )),
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
                                      'Card Settings',
                                      style: CustomTextStyles.headingStyle(),
                                    ),
                                  ],
                                ),
                                Gap.verticalSpace(10.px),
                                Text("Do Card Settings.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff848484),
                                      fontWeight: FontWeight.w500,
                                    )),
                                Gap.verticalSpace(30.px),
                                Text("Card Label",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor)),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Container(
                                  // height: 55.px,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        enabled: false,

                                        // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                        hintText: "  Usman Khan",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    TextFieldColors.borDerColor,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    TextFieldColors.borDerColor,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                ),
                                Gap.verticalSpace(30.px),
                                Text("Security",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor)),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Container(
                                  width: double.infinity,
                                  // height: 52,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff2f3f4)),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gap.verticalSpace(10.px),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Gap.horizontalSpace(4.w),
                                          SvgPicture.asset(
                                              'assets/Icons/wallet_icon.svg'),
                                          Gap.horizontalSpace(2.w),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Lock",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .primaryColor)),
                                              Container(
                                                width: 63.w,
                                                child: Text(
                                                    "Lock your card against fraud and unwanted payments",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff848484))),
                                              ),
                                              Gap.verticalSpace(10.px)
                                            ],
                                          ),
                                          Spacer(),
                                          Transform.scale(
                                            scale: 0.7,
                                            child: Switch(
                                              inactiveTrackColor:
                                                  TextFieldColors.borDerColor,
                                              trackOutlineColor:
                                                  const MaterialStatePropertyAll(
                                                      Colors.transparent),
                                              activeColor:
                                                  AppColors.primaryColor,
                                              inactiveThumbColor:
                                                  AppColors.whiteColor,
                                              activeTrackColor:
                                                  TextFieldColors.borDerColor,
                                              value: switchVal,
                                              onChanged: (value) {
                                                setState(() {
                                                  switchVal = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Gap.verticalSpace(10.px),
                                    ],
                                  ),
                                ),
                                Gap.verticalSpace(30.px),
                                Text("Limits",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor)),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Container(
                                  width: double.infinity,
                                  // height: 52,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff2f3f4)),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gap.verticalSpace(10.px),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Gap.horizontalSpace(4.w),
                                          SvgPicture.asset(
                                              'assets/Icons/wallet_icon.svg'),
                                          Gap.horizontalSpace(2.w),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Set a Limit",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .primaryColor)),
                                              Gap.verticalSpace(3),
                                              Container(
                                                width: 63.w,
                                                child: Text(
                                                    "Set a limit on your monthly expenditures.",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff848484))),
                                              ),
                                              Gap.verticalSpace(10.px)
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 5
                                            ),
                                            child: Icon(
                                              Icons.navigate_next_rounded,
                                              size: 30,
                                              color: Colors.grey.shade400,
                                            ),
                                          )
                                        ],
                                      ),
                                      // Gap.verticalSpace(10.px),
                                    ],
                                  ),
                                ),
                                Gap.verticalSpace(30.px),
                                Text("Others",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor)),
                                SizedBox(
                                  height: 10.px,
                                ),
                                Container(
                                  width: double.infinity,
                                  // height: 52,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff2f3f4)),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gap.verticalSpace(10.px),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Gap.horizontalSpace(4.w),
                                          SvgPicture.asset(
                                              'assets/Icons/delete.svg'),
                                          Gap.horizontalSpace(2.w),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text("Delete the Card ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: AppColors
                                                          .primaryColor)),
                                              Container(
                                                width: 63.w,
                                                child: Text(
                                                    "Your card will be permanently deleted.",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color:
                                                        Color(0xff848484))),
                                              ),
                                              Gap.verticalSpace(10.px)
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5
                                            ),
                                            child: Icon(
                                              Icons.navigate_next_rounded,
                                              size: 30,
                                              color: Colors.grey.shade400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Gap.verticalSpace(15.h),

                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
    bottomNavigationBar: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12
      ),
      margin: EdgeInsets.only(
        bottom: 4.h

      ),
        child:  ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(100.w, 6.h),
                maximumSize: Size(100.w, 6.h),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8)),
                backgroundColor: AppColors.buttonColor),
            onPressed: () {},
            child: Text("Save Changes",
                style: CustomTextStyles.subHeadingStyle(
                    color: AppColors.whiteColor))) ,
    ),
    );
  }
}
