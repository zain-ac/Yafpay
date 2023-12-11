import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/app_colors.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/custom_text_styles.dart';
import '../../bottomnav/bottom_nav.dart';

class AddKycDetailsScreen extends StatefulWidget {
  const AddKycDetailsScreen({super.key});

  @override
  State<AddKycDetailsScreen> createState() => _AddKycDetailsScreenState();
}

class _AddKycDetailsScreenState extends State<AddKycDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.primaryColor,
              child: Column(
                children: [
                  Gap.verticalSpace(8.h),
                  SvgPicture.asset(
                    AppImages.yafPayLogo,
                    width: 50.w,
                  ),
                  Gap.verticalSpace(7.h),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap.verticalSpace(2.5.h),
                              Text(
                                'Complete Your Kyc',
                                style: CustomTextStyles.headingStyle(),
                              ),
                              Gap.verticalSpace(3.px),
                              Text(
                                'Add your KYC Details.',
                                style: CustomTextStyles.subHeadingStyle(),
                              ),
                              Gap.verticalSpace(35.px),
                              Container(
                                height: 50.px,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                      hintText: "Enter Home Address",
                                      hintStyle: CustomTextStyles.subHeadingStyle(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TextFieldColors.borDerColor, width: 1),
                                          borderRadius: BorderRadius.circular(8)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TextFieldColors.borDerColor,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(8))),
                                ),
                              ),
                              Gap.verticalSpace(15.px),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.px,
                                      child: TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(7),
                                            // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                            hintText: "    Select State",
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.all(14),
                                              child: SvgPicture.asset(
                                                'assets/Icons/dropdown.svg',
                                                height: 10,
                                              ),
                                            ),
                                            hintStyle: CustomTextStyles.subHeadingStyle(),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: TextFieldColors.borDerColor,
                                                    width: 1),
                                                borderRadius: BorderRadius.circular(8)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: TextFieldColors.borDerColor,
                                                    width: 0.5),
                                                borderRadius: BorderRadius.circular(8))),
                                      ),
                                    ),
                                  ),
                                  Gap.horizontalSpace(14.px),
                                  Expanded(
                                    child: Container(
                                      height: 50.px,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 20),
                                            // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                            hintText: "Enter City",
                                            hintStyle: CustomTextStyles.subHeadingStyle(),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: TextFieldColors.borDerColor,
                                                    width: 1),
                                                borderRadius: BorderRadius.circular(8)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: TextFieldColors.borDerColor,
                                                    width: 0.5),
                                                borderRadius: BorderRadius.circular(8))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap.verticalSpace(15.px),
                              Container(
                                height: 50.px,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                      hintText: "Enter Zipcode",
                                      hintStyle: CustomTextStyles.subHeadingStyle(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TextFieldColors.borDerColor, width: 1),
                                          borderRadius: BorderRadius.circular(8)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TextFieldColors.borDerColor,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(8))),
                                ),
                              ),
                              Gap.verticalSpace(15.px),
                              Container(
                                width: 100.w,
                                // margin: EdgeInsets.symmetric(
                                //     horizontal: 20.px, vertical: 10.px),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.px, vertical: 10.px),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: TextFieldColors.borDerColor, width: 1),
                                    borderRadius: BorderRadius.circular(8.px)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/Icons/upload_button.svg'),
                                    Gap.verticalSpace(2.px),
                                    Text(
                                      'Upload Bank Statement',
                                      style: CustomTextStyles.subHeadingStyle(),
                                    ),
                                    Text(
                                      'or',
                                      style: CustomTextStyles.subHeadingStyle(),
                                    ),
                                    Gap.verticalSpace(2.px),
                                    Text("Register",
                                        style: CustomTextStyles.subHeadingStyle(
                                            color: AppColors.greenColor))
                                  ],
                                ),
                              ),

                              Gap.verticalSpace(15.px),
                              Container(
                                height: 50.px,
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                      hintText: "Enter Date Of Birth",
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(14),
                                        child:
                                        SvgPicture.asset("assets/Icons/calendar.svg"),
                                      ),
                                      hintStyle: CustomTextStyles.subHeadingStyle(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TextFieldColors.borDerColor, width: 1),
                                          borderRadius: BorderRadius.circular(8)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: TextFieldColors.borDerColor,
                                              width: 0.5),
                                          borderRadius: BorderRadius.circular(8))),
                                ),
                              ),
                              Gap.verticalSpace(8.h),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100.w, 6.h),
                                      maximumSize: Size(100.w, 6.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                      backgroundColor: AppColors.buttonColor),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Continue",
                                      style: CustomTextStyles.subHeadingStyle(
                                          color: AppColors.whiteColor))),

                              Gap.verticalSpace(7.h)
                              // AppTextField.simpleField(context,
                              //     hintText: "example@email.com",
                              //     controller: emailController),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
