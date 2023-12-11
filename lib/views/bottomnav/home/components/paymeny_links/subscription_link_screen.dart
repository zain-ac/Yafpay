import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sample/utils/custom_text_styles.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/custom_text_styles.dart';
import '../add_money/add_money.dart';

class SubscriptionLinkSreen extends StatefulWidget {
  const SubscriptionLinkSreen({super.key});

  @override
  State<SubscriptionLinkSreen> createState() => _SubscriptionLinkSreenState();
}

class _SubscriptionLinkSreenState extends State<SubscriptionLinkSreen> {
  @override
  bool isExpanded = false;
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
                      'Subscription Link',
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
                          height: 13.h,
                        ),
                    Center(
                      child: Image.asset('assets/dummy/img_3.png',width: 270,),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  String hint;
  Field({
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.px,
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(14),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: "Nunito",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff656565),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: TextFieldColors.borDerColor, width: 1),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: TextFieldColors.borDerColor, width: 0.5),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
