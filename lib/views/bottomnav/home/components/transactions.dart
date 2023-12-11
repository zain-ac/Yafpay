import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/transaction_detail_completed.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
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
                                'Transactions',
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
                      const Text("There are your overall Transactions. ",
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                          const TransactionsDetailCompleted()));
                                },
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
                                  'Amazon',
                                  style: CustomTextStyles.subHeadingStyle(
                                      color: AppColors.primaryColor),
                                ),
                                subtitle: Text(
                                  'Eataly Downtown',
                                  style: CustomTextStyles.subHeadingStyle(
                                      size: 13),
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      '${index == 0 ? "-" : "+"} \$56',
                                      style: CustomTextStyles.subHeadingStyle(
                                          color: index == 0
                                              ? AppColors.errorColor
                                              : AppColors.greenColor,
                                          size: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Sep 30',
                                      style: CustomTextStyles.subHeadingStyle(
                                          size: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 0,
                                thickness: 0.5,
                                color: TextFieldColors.borDerColor,
                              ),
                            ],
                          );
                        },
                        itemCount: 5,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
