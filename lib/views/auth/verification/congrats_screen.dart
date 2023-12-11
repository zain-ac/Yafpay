import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_colors.dart';

import '../../../utils/custom_text_styles.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({super.key});

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap.verticalSpace(22.h),
          SvgPicture.asset('assets/Icons/congrats_logo.svg'),
          Gap.verticalSpace(6.h),
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
                  // value.nextStep();
                },
                child: Text("Start",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ),


          Gap.verticalSpace(12.h),
        ],
      ),
    );
  }
}
