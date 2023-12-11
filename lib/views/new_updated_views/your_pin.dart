import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';
import 'number_pad.dart';

class YourPin extends StatefulWidget {
  const YourPin({super.key});

  @override
  State<YourPin> createState() => _YourPinState();
}

class _YourPinState extends State<YourPin> {
  int a = 0;
  String phoneNumber = "";
  OtpFieldController otpController = OtpFieldController();

  // bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap.verticalSpace(8.h),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Gap.verticalSpace(30.99.px),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            children: [
                              Gap.verticalSpace(20.px),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30))),

                                // margin: EdgeInsets.symmetric(horizontal: 25.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Your Pin',
                                        style: CustomTextStyles.headingStyle(),
                                      ),
                                    ),
                                    Gap.verticalSpace(5.px),
                                    Text("Enter your pin.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff848484),
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ),
                              Gap.verticalSpace(30.px),
                              Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 50,
                                      // color: Colors.red,
                                    ),
                                  ),
                                  Center(
                                    child: OTPTextField(
                                      keyboardType: TextInputType.none,
                                      controller: otpController,
                                      length: 4,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      fieldWidth: 55,
                                      style: TextStyle(fontSize: 17),
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceAround,
                                      fieldStyle: FieldStyle.underline,
                                      onCompleted: (pin) {
                                        print("Completed: " + pin);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Gap.verticalSpace(50.px),
                              SizedBox(
                                height: 4.h,
                              ),
                              NumericPad(
                                onNumberSelected: (value) {
                                  setState(() {
                                    if (value != -1) {
                                      phoneNumber =
                                          phoneNumber + value.toString();
                                    } else {
                                      phoneNumber = phoneNumber.substring(
                                          0, phoneNumber.length - 1);
                                    }
                                  });

                                  if (a == 0) {
                                    otpController.setValue(phoneNumber, 0);
                                    a++;
                                    phoneNumber = '';
                                    setState(() {}); //
                                  } else if (a == 1) {
                                    otpController.setValue(phoneNumber, 1);
                                    a++;
                                    phoneNumber = '';
                                    setState(() {});
                                  } else if (a == 2) {
                                    otpController.setValue(phoneNumber, 2);
                                    a++;
                                    phoneNumber = '';
                                    setState(() {});
                                  } else if (a == 3) {
                                    otpController.setValue(phoneNumber, 3);
                                    a = 0;
                                    phoneNumber = '';

                                    setState(() {});
                                  }
                                  // a++;
                                  // otpController.set([phoneNumber]);
                                },
                                onTap: () {
                                  otpController.clear();
                                  phoneNumber = '';
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                // margin: EdgeInsets.only(
                                //     bottom: 4.h
                                // ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100.w, 6.h),
                                        maximumSize: Size(100.w, 6.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: AppColors.buttonColor),
                                    onPressed: () {},
                                    child: Text("Continue",
                                        style: CustomTextStyles.subHeadingStyle(
                                            color: AppColors.whiteColor))),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
