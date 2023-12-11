import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sample/utils/custom_text_styles.dart';

import 'package:sample/views/bottomnav/home/components/foriegn_transfer/widgets/account_dropdown_text.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../utils/custom_text_styles.dart';
import 'foriegn_transfer/widgets/account_dropdown_text.dart';

class TransactionsDetailCompleted extends StatefulWidget {
  const TransactionsDetailCompleted({super.key});

  @override
  State<TransactionsDetailCompleted> createState() =>
      _TransactionsDetailCompletedState();
}

class _TransactionsDetailCompletedState
    extends State<TransactionsDetailCompleted> {
  bool isRepeatButtonSelected = true;
  int selectedButtonIndex = 1;
  bool isChecked = false;

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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
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
                            'Transaction Detail',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text(
                              "Follwing are the details of your transaction. ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(7.px),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 2.3.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(255, 133, 206, 168)
                                          .withOpacity(0.2)),
                              child: const Text(
                                "Completed",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff41b985),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                                    color: const Color(0xffaaaaaa),
                                    size: 14,
                                    text: "Transaction Type",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Date",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Amount Tendered",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Amount Recieved",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Fee",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Payment Reference",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Account Name ",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Account Number ",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Payment Channel ",
                                    size: 14,
                                    color: const Color(0xffaaaaaa),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AccountDropdownText(
                                    color: const Color(0xff656565),
                                    text: "Withdraw",
                                    size: 14,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "08 Oct 2023,22:26",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "£300.00",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "£297.30",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "£3.00",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "cjy3fbajz4a",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "John smith",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "200787340",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AccountDropdownText(
                                    text: "Bank Account",
                                    size: 14,
                                    color: const Color(0xff656565),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 4.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(40.w, 6.h),
                    maximumSize: Size(40.w, 6.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: selectedButtonIndex == 0
                            ? AppColors.buttonColor
                            : Colors.white,
                      ),
                    ),
                    backgroundColor: selectedButtonIndex == 0
                        ? Colors.white
                        : AppColors.buttonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 0; // Select the first button
                    });
                  },
                  child: Text(
                    "Download",
                    style: TextStyle(
                      color: selectedButtonIndex == 0
                          ? AppColors.buttonColor
                          : Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(40.w, 6.h),
                    maximumSize: Size(40.w, 6.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: selectedButtonIndex == 1
                            ? AppColors.buttonColor
                            : Colors.white,
                      ),
                    ),
                    backgroundColor: selectedButtonIndex == 1
                        ? Colors.white
                        : AppColors.buttonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 1;
                    });
                  },
                  child: Text(
                    "Repeat",
                    style: TextStyle(
                      color: selectedButtonIndex == 1
                          ? AppColors.buttonColor
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
