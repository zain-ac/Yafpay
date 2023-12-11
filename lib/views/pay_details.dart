import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helper/gap.dart';
import '../utils/app_colors.dart';
import '../utils/custom_text_styles.dart';
import 'bottomnav/home/components/foriegn_transfer/widgets/account_dropdown_text.dart';
class PayDetails extends StatefulWidget {
  const PayDetails({super.key});

  @override
  State<PayDetails> createState() => _PayDetailsState();
}

class _PayDetailsState extends State<PayDetails> {
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
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                  size: 23,
                )),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap.verticalSpace(20.px),
                          Text(
                            'Payment Details',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text(
                              "Following Are The Details Of Payment Links.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(7.px),
                          SizedBox(
                            height: 2.h,
                          ),

                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AccountDropdownText(
                                    color: const Color(0xffAAAAAA),
                                    text: "Page Name",
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  AccountDropdownText(
                                    text: "Page Type",
                                    color: const Color(0xffAAAAAA),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  AccountDropdownText(
                                    text: "Date Created",
                                    color: const Color(0xffAAAAAA),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  AccountDropdownText(
                                    text: "Payment Url",
                                    color: const Color(0xffAAAAAA),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AccountDropdownText(
                                    color: const Color(0xff656565),
                                    text: "Card Payment",
                                    // fontWeight: FontWeight.w700,
                                    // size: 13,

                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  AccountDropdownText(
                                    text: "Single Charge",
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  AccountDropdownText(
                                    text: "29 September 2023",
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  AccountDropdownText(
                                    text: "https://flutterwave.com/us/",
                                    color: const Color(0xff656565),
                                  ),

                                ],
                              ),
                            ],
                          ),

                        ],
                      )),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                        'Recent Transactions',
                        style: CustomTextStyles.heading(
                            size: 20, fontWeight: FontWeight.w500),
                      ),
                        Icon(CupertinoIcons.ellipsis_vertical, color: const Color(0xffAAAAAA),size: 16,)

                    ],),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Center(child: Image.asset('assets/Icons/transaction.png',width: 120,)),
                  SizedBox(
                    height: 3.h
                    ,
                  ),
                  Center(
                    child: Text(
                        "No transactions Found",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
