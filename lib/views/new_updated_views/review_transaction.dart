import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';
import 'enable_security_app.dart';
import 'enable_text_message.dart';

class ReviewTransaction extends StatefulWidget {
  const ReviewTransaction({super.key});

  @override
  State<ReviewTransaction> createState() => _ReveiewTransactionState();
}

class _ReveiewTransactionState extends State<ReviewTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [

            Column(
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
                                        'Review transaction',
                                        style: CustomTextStyles.headingStyle(
                                            size: 22),
                                      ),
                                    ],
                                  ),
                                  Gap.verticalSpace(5.px),
                                  Text("Review Your Deposit Details",
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Gap.verticalSpace(30.px),
                                  Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF2F3F4),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text("NGN Balance Deposit",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff848484),
                                              fontWeight: FontWeight.w400,
                                            )),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Text("₦56,789.09",
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Amount to pay",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffAAAAAA),
                                            fontWeight: FontWeight.w400,
                                          )),
                                      Text("₦56,789.09",
                                          style: TextStyle(
                                            color: Color(0xff656565),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.px,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Transaction Fee",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffAAAAAA),
                                            fontWeight: FontWeight.w400,
                                          )),
                                      Text("₦70.00",
                                          style: TextStyle(
                                            color: Color(0xff656565),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.px,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Amount You Will Recieve ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffAAAAAA),
                                            fontWeight: FontWeight.w400,
                                          )),
                                      Text("₦1,9320.00",
                                          style: TextStyle(
                                            color: Color(0xff656565),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.px,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Payment method",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffAAAAAA),
                                            fontWeight: FontWeight.w400,
                                          )),
                                      Text("Mono",
                                          style: TextStyle(
                                            color: Color(0xff656565),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ))
                                    ],
                                  ),

                                  SizedBox(
                                    height: 40.h,
                                  ),

                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 4.w,
              right: 4.w,
              bottom: 4.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 6.h),
                      maximumSize: Size(100.w, 6.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: AppColors.buttonColor),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>ReviewTransaction()));
                  },
                  child: Text("Make Payment",
                      style: CustomTextStyles.subHeadingStyle(
                          color: AppColors.whiteColor))),
            ),
          ],
        ));
  }
}
