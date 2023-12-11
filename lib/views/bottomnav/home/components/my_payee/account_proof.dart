import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sample/utils/custom_text_styles.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';
import '../add_money/add_money.dart';

class AccountProof extends StatefulWidget {
  const AccountProof({super.key});

  @override
  State<AccountProof> createState() => _AccountProofState();
}

class _AccountProofState extends State<AccountProof> {
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
                  Icons.arrow_back_ios_sharp,
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
                            'Account Proof',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text("Add Your Account Details For Proof . ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(30.px),
                          ContainerTextField(
                            t1: "Select Currency",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(10.px),
                          const Text(
                            "Note: Your Proof Of Account Will Be Dated 30 Of September 2023",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff161616),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
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
                onPressed: () {},
                child: Text("Download Account Proof",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          )
        ],
      ),
    );
  }
}
