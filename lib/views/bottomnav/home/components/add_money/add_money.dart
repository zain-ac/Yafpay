import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/custom_text_styles.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
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
                            'Add Money',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const Text("Add Enter Details To Add Money. ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          SizedBox(
                            height: 4.h,
                          ),
                          const Text(
                            "Balance to Top up",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff142445),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Gap.verticalSpace(10.px),
                          ContainerTextField(
                            image: true,
                            imt: 'assets/Icons/uk.png',
                            // svg: SvgPicture.asset('assets/Icons/password_show.svg'),
                            t1: "TZS   Balance",
                            t2: "Tsh0.00",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          SizedBox(
                            height: 20.px,
                          ),
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
                          Gap.verticalSpace(10.px),
                          ContainerTextField(
                            t1: "Pay Via Mobile Money(TIGO/AIRTEL)",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          SizedBox(
                            height: 20.px,
                          ),
                          ContainerTextField(
                            t1: "Select Network Type",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          SizedBox(
                            height: 20.px,
                          ),
                          ContainerTextField(
                            t1: "Amount To Top Up Tsh 0.00",
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff3b3b3b),
                            ),
                          ),
                          SizedBox(
                            height: 20.px,
                          ),
                          ContainerTextField(
                            t1: "Amount To Recieve N0.00",
                            child: Container(
                              height: 2.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: TextFieldColors.borDerColor),
                              child: const Text(
                                "Fee: Tsh0.00",
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
                          SizedBox(
                            height: 15.h,
                          ),
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
                child: Text("Continue",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          )
        ],
      ),
    );
  }
}

class ContainerTextField extends StatelessWidget {
  String t1;
  String? t2;
  SvgPicture? svg;
  Widget? child;
  bool image;

  String imt;

  ContainerTextField({
    this.svg,
    this.child,
    this.image = false,
    this.imt = '',
    required this.t1,
    this.t2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: TextFieldColors.borDerColor,
            ),
            borderRadius: BorderRadius.circular(7)),
        height: 50.px,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  image
                      ? Image.asset(
                          imt,
                          scale: 2 / 1,
                        )
                      : svg != null
                          ? svg!
                          : Container(),
                  Gap.horizontalSpace(6.px),
                  Text(
                    t1,
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
              if (t2 != null)
                Text(
                  t2!,
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
              if (child != null) child!
            ],
          ),
        ));
  }
}
