import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/add_money/add_money.dart';
import '../../../../../helper/gap.dart';

import '../../../../../utils/app_colors.dart';

class YafpayUser extends StatefulWidget {
  const YafpayUser({super.key});

  @override
  State<YafpayUser> createState() => _YafpayUserState();
}

class _YafpayUserState extends State<YafpayUser> {
  bool isChecked = false;
  bool enterData = false;

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
                            'YAFPAY Tag',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text("Add Your YAFPAY Tag Details,",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(25.px),
                          const Text(
                            "Balance To Send From",
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
                            t1: "British Pound",
                            t2: "£9.00",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(15.px),
                          Container(
                            height: 50,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.contains('@')) {
                                  enterData = true;
                                } else {
                                  enterData = false;
                                }
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                hintText: '@ Enter Recipient Tag',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: TextFieldColors.borDerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: TextFieldColors.borDerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: TextFieldColors.borDerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Gap.verticalSpace(7.px),
                          enterData
                              ? Text(
                                  "Recipient Name",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff142445),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              : Container(),
                          enterData ? Gap.verticalSpace(7.px) : Container(),
                          enterData
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 50,
                                    child: TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffDCDCDC),
                                          contentPadding: EdgeInsets.all(8),
                                          hintText: 'Victor Oni',
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff3C3C3C),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  TextFieldColors.borDerColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          )),
                                    ),
                                  ),
                                )
                              : Container(),
                          enterData ? Gap.verticalSpace(15.px) : Container(),
                          enterData
                              ? Text(
                                  "Recipient’s Balance",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff142445),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              : Container(),
                          enterData ? Gap.verticalSpace(7.px) : Container(),
                          enterData
                              ? Container(
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
                                                color:
                                                    TextFieldColors.borDerColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff3b3b3b),
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
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
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
                                )
                              : Container(),
                          enterData ? Gap.verticalSpace(15.px) : Container(),
                          Text(
                            "Amount To Send",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          enterData ? Gap.verticalSpace(7.px) : Container(),
                          ContainerTextField(
                            t1: "\$0.00",
                          ),
                          enterData ? Gap.verticalSpace(15.px) : Container(),
                          enterData
                              ? ContainerTextField(
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
                                )
                              : Container(),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Add Description",
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
                child: Text("Create Tag",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          )
        ],
      ),
    );
  }
}
