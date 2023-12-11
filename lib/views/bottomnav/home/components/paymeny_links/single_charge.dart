import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/payment_link_list.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/subscription_link_screen.dart';

import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/payment_link_list.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/payment_link_list_detail.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/subscription_link_screen.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/custom_text_styles.dart';
import '../add_money/add_money.dart';

class SingleCharge extends StatefulWidget {
  const SingleCharge({super.key});

  @override
  State<SingleCharge> createState() => _SingleChargeState();
}

class _SingleChargeState extends State<SingleCharge> {
  @override
  bool isExpanded = true;
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
                        'Single Charge',
                        style: CustomTextStyles.heading(
                            size: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Text("Add Your Payment Link Details. ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff848484))),
                      SizedBox(
                        height: 5.h,
                      ),
                      Field(hint: "Add Payment Link Name"),
                      Gap.verticalSpace(18.px),
                      Container(
                          height: 45,
                          width: 350,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffDCDCDC)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Container(
                                width: 35.w,
                                height: 45,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    color: Color.fromARGB(255, 233, 233, 233)),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "NGN",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff484848),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(Icons.keyboard_arrow_down_outlined)
                                    ],
                                  ),
                                ),
                              ),
                              Gap.horizontalSpace(10),
                              const Text(
                                "0.00",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff656565),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Note: Leave empty to allow customers enter desired amount.",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff161616),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double
                            .infinity, // You can adjust the width as needed
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: TextFieldColors
                                .borDerColor, // You can define this color
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add Description",
                          ),
                        ),
                      ),
                      Gap.verticalSpace(25.7.px),
                      Row(
                        children: [
                          const Text(
                            "More Options",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          IconButton(
                            icon: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                          )
                        ],
                      ),
                      isExpanded
                          ? Container()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap.verticalSpace(20.px),
                                Container(
                                    height: 45,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffDCDCDC)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 42.w,
                                          height: 45,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  bottomLeft:
                                                      Radius.circular(8)),
                                              color: Color.fromARGB(
                                                  255, 233, 233, 233)),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "http://flutterwave",
                                                  style: TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff484848),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(Icons
                                                    .keyboard_arrow_down_outlined)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Gap.horizontalSpace(10),
                                        const Text(
                                          "Your URL",
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff656565),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    )),
                                Gap.verticalSpace(15.px),
                                ContainerTextField(
                                  t1: "Select Currencies",
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Color(0xff3b3b3b),
                                  ),
                                ),
                                Gap.verticalSpace(15.px),
                                ContainerTextField(
                                  t1: "Select Subaccount to split payment with",
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Color(0xff3b3b3b),
                                  ),
                                ),
                                Gap.verticalSpace(5.px),
                                const Text(
                                  "Note: This allows you to share payments received from this link with a subaccount.",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff1d1d1d),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Gap.verticalSpace(5.px),
                                const Text(
                                  "Redirect after payment",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff142445),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Gap.verticalSpace(10.px),
                                Field(
                                  hint: "http://google.com",
                                ),
                                Gap.verticalSpace(10.px),
                                const Text(
                                  "Collect extra information",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff142445),
                                    height: 22 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Gap.verticalSpace(10.px),
                                Field(
                                  hint: "Phone Number",
                                ),
                                Gap.verticalSpace(10.px),
                                Field(
                                  hint: "Enter Field Name",
                                ),
                                Gap.verticalSpace(9.px),
                                const Text(
                                  "Add New",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff142445),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Gap.verticalSpace(71.px),
                              ],
                            ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.w, 6.h),
                              maximumSize: Size(100.w, 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: AppColors.buttonColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const PaymentLinkList()));
                          },
                          child: Text("Create Payment Link",
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor))),
                      Gap.verticalSpace(47.px),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}