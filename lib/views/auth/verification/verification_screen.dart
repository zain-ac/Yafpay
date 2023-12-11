import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/views/auth/verification/add_kyc_details.dart';
import 'package:sample/views/bottomnav/bottom_nav.dart';
import 'package:sample/views/bottomnav/new_nav.dart';

import '../../../helper/gap.dart';
import '../../../utils/custom_text_styles.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Gap.verticalSpace(2.5.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => LoginScreen()));
                },
                child: Text("Skip",
                    style:
                        CustomTextStyles.subHeadingStyle(color: Colors.white))),
          ),
          SvgPicture.asset('assets/Icons/verifyaccount.svg'),
          Text(
            'Verify Account',
            style: CustomTextStyles.heading(
                color: AppColors.whiteColor, fontWeight: FontWeight.w500),
          ),
          Gap.verticalSpace(1.h),
          Text(
            'Your account has been created verify it',
            style: CustomTextStyles.subHeadingStyle(
              color: AppColors.whiteColor,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AddKycDetailsScreen()));
                  // value.nextStep();
                },
                child: Text("Verify Now",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ),
          Gap.verticalSpace(2.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColors.errorColor
                      ),
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.primaryColor),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewNav()));
                  // value.nextStep();
                },
                child: Text("Skip For Now",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.errorColor))),
          ),
          Gap.verticalSpace(2.h),
        ],
      ),
    );
  }
}
