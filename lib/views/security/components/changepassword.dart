import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/custom_text_styles.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
      bottomNavigationBar: Container(
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
                        'Change Password',
                        style: CustomTextStyles.heading(
                            size: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text("Reset your password. ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff848484))),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(14),
                                child: SvgPicture.asset(
                                    'assets/Icons/password_show.svg'),
                              ),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter old Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      SizedBox(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(14),
                                child: SvgPicture.asset(
                                    'assets/Icons/password_show.svg'),
                              ),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter new Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      SizedBox(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(14),
                                child: SvgPicture.asset(
                                    'assets/Icons/password_show.svg'),
                              ),
                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter new Password Again",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.w, 6.h),
                              maximumSize: Size(100.w, 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: AppColors.buttonColor),
                          onPressed: () {},
                          child: Text("Reset Password",
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor))),
                      Gap.verticalSpace(2.h),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
