import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/custom_text_styles.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
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
                            'Top Up',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(4.px),
                          const Text("Enter The amount to be Top up.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(30.px),
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                        // width: 170,
                                        // height: 113,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color(0xfff2f3f4)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Gap.verticalSpace(3.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "\$00.09",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                )
                                            ),
                                            Gap.horizontalSpace(1.w),
                                            Baseline(
                                              baseline: 1.7.h, // Adjust this value for the desired alignment
                                              baselineType: TextBaseline.ideographic,
                                              child: Text(
                                                'USD',
                                                style: TextStyle(
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),),
                                          ],
                                        ),
                                        Gap.verticalSpace(1.h),
                                        Divider(
                                          color: Color(0xffD6D6D6),
                                        ),
                                        Gap.verticalSpace(1.h),
                                        Text(
                                            "New Balance: 4.76 USD",
                                            style: TextStyle(
                                              fontSize: 11,
                                              letterSpacing: -.5,
                                              color: Color(0xff848484),
                                              fontWeight: FontWeight.w500,
                                            )
                                        ),
                                        Gap.verticalSpace(20)
                                      ],
                                    ),
                                    ),
                                  ),
                                  Gap.horizontalSpace(10.px),
                                  Expanded(
                                    child: Container(
                                      // width: 170,
                                      // height: 113,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Color(0xfff2f3f4)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Gap.verticalSpace(3.h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "XAF00,00",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                              ),
                                              Gap.horizontalSpace(1.w),
                                              Baseline(
                                                baseline: 1.7.h, // Adjust this value for the desired alignment
                                                baselineType: TextBaseline.ideographic,
                                                child: Text(
                                                  'FCFA',
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Gap.verticalSpace(1.h),
                                          Divider(
                                            color: Color(0xffD6D6D6),
                                          ),
                                          Gap.verticalSpace(1.h),
                                          Text(
                                              "New Balance: 4.76 USD",
                                              style: TextStyle(
                                                fontSize: 11,
                                                letterSpacing: -.5,
                                                color: Color(0xff848484),
                                                fontWeight: FontWeight.w500,
                                              )
                                          ),
                                          Gap.verticalSpace(20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(

                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                      child: SvgPicture.asset(
                                          'assets/Icons/exchage.svg',width: 25,))),
                            ],
                          ),

                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 3.h,
            left: 2.w,
            right: 2.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {
                  showDialog(
                    context: context,

                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 27.h,
                          padding: EdgeInsets.only(
                              left: 12.px,right: 12.px
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                  "Confirm",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Text(
                                  "Are You Sure To Withdraw?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )
                              ),
                              SizedBox(
                                height: 60,
                              ),

                              Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 6.h,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              // minimumSize: Size(50.w, 6.h),
                                              // maximumSize: Size(50.w, 6.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8)),
                                              backgroundColor:
                                              AppColors.buttonColor),
                                          onPressed: () {

                                            Navigator.pop(context);
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //         const CreateReferalls()));
                                          },
                                          child: Text("Yes",
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                  color:
                                                  AppColors.whiteColor))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.px,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 6.h,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // minimumSize: Size(50.w, 6.h),
                                            // maximumSize: Size(50.w, 6.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8)),
                                              backgroundColor:
                                              Color(0xffF1F1F1)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //         const CreateReferalls()));
                                          },
                                          child: Text("NO",
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                  color:
                                                  Color(0xff9F9F9F)))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),

                      );
                    },
                  );
                },
                child: Text("Top Up",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ),
        ],
      ),
    );
  }
}
