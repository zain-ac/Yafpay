import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/custom_text_styles.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';
import '../add_money/add_money.dart';

class TopUpFunds extends StatefulWidget {
  const TopUpFunds({super.key});

  @override
  State<TopUpFunds> createState() => _TopUpFundsState();
}

class _TopUpFundsState extends State<TopUpFunds> {
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
                            'Top Up Funds',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(4.px),
                          const Text("Add Your Top Up Funds Details. ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(25.px),
                          
                          const Text(
                            "Balance to Transfer From",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Gap.verticalSpace(7.px),
                          ContainerTextField(
                            imt: 'assets/Icons/uk.png',
                            image: true,

                            // svg: SvgPicture.asset('assets/Icons/password_show.svg'),
                            t1: "  British Pound",
                            t2: "£9.00",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text(
                            "Payment Method",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Gap.verticalSpace(7.px),
                          ContainerTextField(
                            t1: "Select Payment Method",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text(
                            "Amount to swap",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Gap.verticalSpace(7.px),
                          ContainerTextField(
                            t1: "\$0.00",
                          ),
                          Gap.verticalSpace(7.px),
                          const Text(
                            "Amount user will recieve",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Gap.verticalSpace(7.px),
                          ContainerTextField(
                            t1: "\$0.00",
                          ),
                          Gap.verticalSpace(7.px),
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
                                'I Confirm to Debit \$0 to my Balance',
                                style: TextStyle(
                                    color: Color(0xff848484),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),

                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(left: 4.w,
          right: 4.w
            ,

          bottom: 4.h,
          child:       ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 6.h),
                  maximumSize: Size(100.w, 6.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: AppColors.buttonColor),
              onPressed: () {},
              child: Text("Transfer Swap Funds",
                  style: CustomTextStyles.subHeadingStyle(
                      color: AppColors.whiteColor))),)
        ],
      ),
    );
  }
}
