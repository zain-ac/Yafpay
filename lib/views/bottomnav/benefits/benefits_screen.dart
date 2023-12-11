import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';
import 'components/add_benifiery.dart';
import 'controller/benefits_controller.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BenefitsController>(
      builder: (context, value, child) {
        return Scaffold(
            floatingActionButton:
            FloatingActionButton(
                backgroundColor: Color(0xffF24D4D),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AddBenifeiry()));
                  // AddBenifeiry
                },
                child: SvgPicture.asset('assets/Icons/plus.svg'))
              ,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    child: Column(
                      children: [
                        Gap.verticalSpace(7.h),
                        SvgPicture.asset(
                          AppImages.benefitsImg,
                          // width: 40.w,
                        ),
                        Gap.verticalSpace(25.99.px),
                        Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.px),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30))),
                                child: Column(
                                  children: [
                                    Gap.verticalSpace(20.px),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Beneficiary',
                                              style: CustomTextStyles
                                                  .headingStyle(),
                                            ),
                                            Text(
                                              'There are you overall beneficiary.',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(size: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    buildCustomerView(value)
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  buildCustomerView(BenefitsController provider) {
    if (provider.invoiceList.isNotEmpty) {
      return Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    minLeadingWidth: 40,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff6f5f5)),
                      child: Center(
                        child: Image.asset(
                          'assets/images/flag1.png',
                          width: 5.w,
                        ),
                      ),
                    ),
                    title: Text(
                      'Justice Elechi',
                      style: CustomTextStyles.subHeadingStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      '200787340',
                      style: CustomTextStyles.subHeadingStyle(size: 11),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>AddBenifeiry()));
                            },
                            child: SvgPicture.asset('assets/images/vertical_option.svg')),
                        Gap.verticalSpace(1.h),
                        Text("kUDA",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff848484),
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.5,
                    color: TextFieldColors.borDerColor,
                  ),
                ],
              );
            },
            itemCount: 10,
          ),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Icons/nocustomer.svg'),
            Gap.verticalSpace(16.px),
            Text("No Beneficiary Found",
                style: CustomTextStyles.subHeadingStyle(
                    color: TextFieldColors.borDerColor,
                    size: 12,
                    fontWeight: FontWeight.w500)),
            Gap.verticalSpace(10.h),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {},
                child: Text("Create beneficiary",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ],
        ),
      );
    }
  }
}
