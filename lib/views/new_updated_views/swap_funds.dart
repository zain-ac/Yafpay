import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sample/views/new_updated_views/review_transaction.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';
import '../bottomnav/home/components/add_money/add_money.dart';

class SwapFunds extends StatefulWidget {
  const SwapFunds({super.key});

  @override
  State<SwapFunds> createState() => _SwapFundsState();
}

class _SwapFundsState extends State<SwapFunds> {
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
                            'Swap Funds',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(4.px),
                          const Text("Add your Swap Funds details",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(25.px),
                          Text(
                            "Balance to Swap From",
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
                                                'assets/dummy/flag.png',
                                                scale: 2 / 1,
                                              ),
                                              // : svg != null
                                              // ? svg!
                                              // : Container(),
                                              Gap.horizontalSpace(6.px),
                                              Text(
                                                'EUR Balance',
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

                          Gap.verticalSpace(6.h),
                          const Text(
                            "Balance to Swap to",
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
                            t2: "£0.00",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          Gap.verticalSpace(7.px),


                          const Text(
                            "Amount to top up",
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 13),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: TextFieldColors.borDerColor,
                                ),
                                borderRadius: BorderRadius.circular(7)),
                            height: 50.px,
                            child: Row(
                              children: [
                                Text(
                                  '\$0.00',
                                  style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3b3b3b),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: Color(0xff1424451A),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text("Fee: Tsh0.00",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                )
                              ],
                            ),
                          ),

                          Gap.verticalSpace(7.px),
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ReviewTransaction()));
                },
                child: Text("Transfer Swap Funds",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          )
        ],
      ),
    );
  }
}
