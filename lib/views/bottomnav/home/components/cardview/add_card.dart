import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../helper/gap.dart';
import '../../../../../helper/public_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/custom_text_styles.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool isChecked = false;
  void toggleCheckbox(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 4.h,
          left: 2.w,
          right: 2.w,
        ),
        child:       ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(100.w, 6.h),
                maximumSize: Size(100.w, 6.h),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8)),
                backgroundColor: AppColors.buttonColor),
            onPressed: () {
              // value.nextStep();
              // if(value.currentStep == 3){
              //   Navigator.push(context, MaterialPageRoute(builder: (_)=>VerificationScreen()));
              // }
            },
            child: Text("Create Card",
                style: CustomTextStyles.subHeadingStyle(
                    color: AppColors.whiteColor))),
      ),
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Gap.verticalSpace(4.h),
                    PublicHelper().backButton(
                      back: true,
                      context: context,
                    ),
                    Image.asset(
                      'assets/Icons/add_card.png',
                      height: 22.h,
                      width: 80.w,
                      fit: BoxFit.cover,
                    ),
                    Gap.verticalSpace(5.h),
                    Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20.px),
                            decoration: const BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap.verticalSpace(2.5.h),
                                Text(
                                  'You will Be Charged A one\ntime Fee',
                                  style: CustomTextStyles.headingStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap.verticalSpace(3.px),
                                Text(
                                  'You will Be Charged A one time Fee of \$4 from\nyour USD balance. below is the breakdown :',
                                  style: CustomTextStyles.subHeadingStyle(),
                                ),
                                Gap.verticalSpace(2.h),
                                Container(
                                  width: double.infinity,
                                  // height: 18.h,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff1424450d)
                                          .withOpacity(0.05),
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Gap.verticalSpace(14.px),
                                      Text(
                                        'Card Creation Fees',
                                        style: CustomTextStyles.subHeadingStyle(
                                            color: AppColors.primaryColor,
                                            size: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Gap.verticalSpace(7.px),
                                      Text(
                                        "One time charges for the creation of card ",
                                        style:
                                            CustomTextStyles.subHeadingStyle(),
                                      ),
                                      Gap.verticalSpace(5.px),
                                      const Divider(
                                        color: TextFieldColors.borDerColor,
                                      ),
                                      Gap.verticalSpace(5.px),
                                      Text(
                                        'Card Top - Up',
                                        style: CustomTextStyles.subHeadingStyle(
                                            color: AppColors.primaryColor,
                                            size: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Gap.verticalSpace(7.px),
                                      Text(
                                        "This is credit to your virtual card ",
                                        style:
                                            CustomTextStyles.subHeadingStyle(),
                                      ),
                                      Gap.verticalSpace(14.px),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      activeColor: Colors.green,
                                      // Change the color of the checked circle
                                      checkColor: Colors.white,
                                      // Change the color of the checkmark
                                      value: isChecked,
                                      onChanged: (value) {
                                        toggleCheckbox(value!);
                                      },
                                    ),
                                    Text(
                                      'I Confirm To Pay These Charges',
                                      style: CustomTextStyles.subHeadingStyle(),
                                    ),
                                  ],
                                ),


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
  }
}
