import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/send_to_beneficiary.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/send_to_new_recipient.dart';
import 'package:sample/views/bottomnav/home/components/yafpay_user/yafpay_user.dart';
import 'package:sample/views/bottomnav/home/widgets/bottom_nav_tile.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class MyPayee extends StatefulWidget {
  const MyPayee({super.key});

  @override
  State<MyPayee> createState() => _MyPayeeState();
}

class _MyPayeeState extends State<MyPayee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap.verticalSpace(3.h),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                  size: 30,
                )),
          ),
          SizedBox(
            child: SvgPicture.asset(
              'assets/Icons/my_payee.svg',
              width: 60.w,
            ),
          ),
          Gap.verticalSpace(1.h),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: 70.h,
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
                        'Send Funds',
                        style: CustomTextStyles.heading(
                            size: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      BottomNavTiles(
                        text1: "Send by tags",
                        text2:
                            "Send funds instantly to your friends using their tags. ",
                        img: SvgPicture.asset(
                          'assets/Icons/tag.svg',
                        ),
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const YafpayUser()));
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      BottomNavTiles(
                        text1: "Send To Beneficiary",
                        text2:
                            "Choose from one of your beneficiary to make withdraw.",
                        img: SvgPicture.asset(
                          'assets/Icons/user.svg',
                        ),
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SendToBeneficiery()));
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      BottomNavTiles(
                        text1: "Send To New Recipient",
                        text2:
                            "Enter details of account to haven't previously saved for withdraw. ",
                        img: SvgPicture.asset(
                          'assets/Icons/recipient.svg',
                        ),
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SendToNewRecepient()));
                        },
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
