import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/custom_text_styles.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class PaymentLinkListDetail extends StatefulWidget {
  const PaymentLinkListDetail({super.key});

  @override
  State<PaymentLinkListDetail> createState() => _PaymentLinkListDetailState();
}

class _PaymentLinkListDetailState extends State<PaymentLinkListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
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
                    size: 30,
                  )),
            ),
            SizedBox(
              child: SvgPicture.asset(
                'assets/images/account_img.svg',
                width: 50.w,
              ),
            ),
            Gap.verticalSpace(2.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: 70.h,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Payment Link List',
                                style: CustomTextStyles.heading(
                                    size: 24, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/Icons/filter.svg',
                          ),
                        ],
                      ),
                      const Text("There are your overall Invoices.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff848484))),
                      Gap.verticalSpace(25.px),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                  onTap: () {},
                                  minLeadingWidth: 40,
                                  leading: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xfff6f5f5)),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          'assets/images/trnasaction_card.svg'),
                                    ),
                                  ),
                                  title: Text(
                                    'Card Payment',
                                    style: CustomTextStyles.subHeadingStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                  subtitle: const Row(
                                    children: [
                                      Text(
                                        "https://flutterwave.compay...",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff848484),
                                          height: 10 / 10,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(
                                        Icons.copy,
                                        color: Color(0xff36BC6C),
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )),
                              const Divider(
                                thickness: 0.5,
                                color: TextFieldColors.borDerColor,
                              ),
                            ],
                          );
                        },
                        itemCount: 6,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.add,
          size: 37,
        ),
      ),
    );
  }
}
