import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/add_money/add_money.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class SendToBeneficiery extends StatefulWidget {
  const SendToBeneficiery({super.key});

  @override
  State<SendToBeneficiery> createState() => _SendToBeneficieryState();
}

class _SendToBeneficieryState extends State<SendToBeneficiery> {
  bool isChecked = false;

  void toggleCheckbox(bool value) {
    setState(() {
      isChecked = value;
    });
  }

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
                            'Sent To Beneficiary',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text("Add Your Saved Beneficiary Details",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(25.px),
                          const Text(
                            "Balance To Tranfer From",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Gap.verticalSpace(7.px),
                          Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                                color: Color(0xff1424451A),
                                borderRadius: BorderRadius.circular(8)),
                            child: Stack(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: TextFieldColors.borDerColor,
                                        ),
                                        borderRadius: BorderRadius.circular(7)),
                                    height: 50.px,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/Icons/uk.png',
                                                scale: 2 / 1,
                                              ),
                                              // : svg != null
                                              // ? svg!
                                              // : Container(),
                                              Gap.horizontalSpace(6.px),
                                              Text(
                                                'British Pound',
                                                style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3b3b3b),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          // if (t2 != null)
                                          Text(
                                            '£9.00',
                                            style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff142445),
                                              height: 14 / 16,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Color(0xff3b3b3b),
                                          ),
                                          // if (child != null) child!
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  left: 10,
                                  bottom: 5,
                                  right: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Current Rate",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      Text("1€ = £260.00684",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),


                          Gap.verticalSpace(15.px),
                          const Text(
                            "Currency to receive in",
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
                            imt: 'assets/dummy/ngn.png',
                            image: true,
                            // t1: "British Pound",
                            // t2: "£9.00",
                            t1: 'NGN Balance',
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),

                          Gap.verticalSpace(7.px),
                          ContainerTextField(
                            t1: "Amount To Send \$0.00",
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Amount To Recieve N0.00",
                            child: Container(
                              height: 2.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: TextFieldColors.borDerColor),
                              child: const Text(
                                "Fee: \$0.00",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff142445),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Select Saved NGN Recipient",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Naration",
                            // child: const Icon(
                            //   Icons.keyboard_arrow_down_outlined,
                            //   color: Color(0xff3b3b3b),
                            // ),
                          ),
                          Gap.verticalSpace(5.px),
                          const Text(
                            "Optional",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //       value: isChecked,
                          //       onChanged: (bool? value) {
                          //         setState(() {
                          //           isChecked = value ?? false;
                          //         });
                          //       },
                          //     ),
                          //     const Text(
                          //       'I Confirm to Debit \$0 to my Balance',
                          //       style: TextStyle(
                          //           color: Color(0xff848484),
                          //           fontSize: 13,
                          //           fontWeight: FontWeight.w400),
                          //     ),
                          //   ],
                          // ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            left: 4.w,
            right: 4.w,
            bottom: 4.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {},
                child: Text("Send To Beneficiary",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          )
        ],
      ),
    );
  }
}
