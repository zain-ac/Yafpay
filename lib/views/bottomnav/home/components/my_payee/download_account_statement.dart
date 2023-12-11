import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/add_money/add_money.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class DownloadAccountStatement extends StatefulWidget {
  const DownloadAccountStatement({super.key});

  @override
  State<DownloadAccountStatement> createState() =>
      _DownloadAccountStatementState();
}

class _DownloadAccountStatementState extends State<DownloadAccountStatement> {
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
                            'Account Statement',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text(
                              "Add Your Account Statement Details To Download.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(25.px),
                          ContainerTextField(
                             image: true,
                            imt: "assets/Icons/uk.png",
                            // svg: Image.as(''),
                            t1: "British Pound",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Start Date",
                            child: const Icon(
                              Icons.calendar_month,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "End Date",
                            child: const Icon(
                              Icons.calendar_month,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(15.px),
                          const Text(
                            "Format Type",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                              ),
                              const Text(
                                "CSV",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff656565),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Gap.horizontalSpace(7.px),
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                              ),
                              const Text(
                                "PDF",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff656565),
                                  height: 18 / 16,
                                ),
                                textAlign: TextAlign.left,
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
            right: 4.w,
            left: 4.w,
            bottom: 4.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {},
                child: Text("Download Statement",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          )
        ],
      ),
    );
  }
}
