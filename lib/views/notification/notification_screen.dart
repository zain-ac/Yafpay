import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../helper/gap.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                              children: [
                                Gap.verticalSpace(20.px),
                                Row(
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Notifications',
                                      style: CustomTextStyles.headingStyle(),
                                    ),
                                  ],
                                ),
                                Gap.verticalSpace(30.px),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 10,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 17,
                                              backgroundColor: Colors.grey.shade400,
                                              child: Icon(
                                                 Icons.person,color: Colors.white,),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SizedBox(
                                              width: 70.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "After 2 failed payment due to low balance. Your card is blocked.",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff707070),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                 index == 1 ? ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              AppColors
                                                                  .errorColor,
                                                          minimumSize:
                                                              Size(20.w, 3.h),
                                                          maximumSize:
                                                              Size(20.w, 3.h),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Pay Now",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 11),
                                                      )):SizedBox.shrink(),
                                                  SizedBox(
                                                    height:5,
                                                  ),
                                                  Text(
                                                    'Last Wednesday at 9:42 AM',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                        color:
                                                            Color(0xffA5ACB8)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                       index == 9?SizedBox.shrink(): SvgPicture.asset(
                                            'assets/dummy/divider_code.svg'),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    );
                                  },
                                )
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
