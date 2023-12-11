import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../helper/gap.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_text_styles.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
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
                    Gap.verticalSpace(4.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: AppColors.whiteColor,
                            size: 23,
                          )),
                    ),
                    Gap.verticalSpace(3.h),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.px),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: Column(
                              children: [
                                Gap.verticalSpace(20.px),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Transactions Details',
                                          style:
                                              CustomTextStyles.headingStyle(),
                                        ),
                                        Text(
                                          'Following are the detail of your transaction.',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 14),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Gap.verticalSpace(8.h),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      width: 100,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0x1936bc6c)),
                                      child: const Center(
                                        child: Text("completed",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff36BC6C),
                                              fontWeight: FontWeight.w600,
                                            )),
                                      )),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transaction type",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("Withdraw",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Date",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("8 October 202, 22:26",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount Tendered",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("£300.00",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount Received",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("£297.30",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Fee",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("£3.00",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Payment Reference",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("cjy3fbajz4a",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Account Name",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("john smith",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Account Number",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("200787340",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Payment Channel",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffAAAAAA),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text("bank account",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                Gap.verticalSpace(20.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: Size(40.w, 6.h),
                                              // maximumSize: Size(100.w, 6.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              backgroundColor:
                                                  AppColors.buttonColor),
                                          onPressed: () {},
                                          child: Text("Download",
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: AppColors
                                                          .whiteColor))),
                                    ),
                                    Gap.horizontalSpace(2.w),
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(

                                              // minimumSize: Size(100.w, 6.h),
                                              minimumSize: Size(40.w, 6.h),
                                              // maximumSize: Size(100.w, 6.h),
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.5,
                                                      color:
                                                          AppColors.errorColor),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              backgroundColor: Colors.white),
                                          onPressed: () {},
                                          child: Text("Repeat",
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: AppColors
                                                          .errorColor))),
                                    ),
                                  ],
                                )
                                // transactionView(provider)
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
