import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';
import '../home/components/transaction_detail_completed.dart';
import 'components/transaction_details_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, provider, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(

              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    child: Column(
                      children: [
                        Gap.verticalSpace(8.h),
                        SvgPicture.asset(
                          AppImages.transactionLogo,
                          width: 40.w,
                        ),
                        Gap.verticalSpace(25.99.px),
                        Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.px),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30))),
                                child: Column(
                                  children: [
                                    Gap.verticalSpace(20.px),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Transactions',
                                              style: CustomTextStyles
                                                  .headingStyle(),
                                            ),
                                            Text(
                                              'There are your overall transactions.',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(size: 14),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        InkWell(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (_) => MyCards()));
                                            },
                                            child: SvgPicture.asset(
                                                'assets/Icons/filter_icon.svg'))
                                      ],
                                    ),
                                    transactionView(provider)
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
      },
    );
  }

  transactionView(TransactionController provider) {
    if (provider.transactionList.isNotEmpty) {
      return Column(
        children: [
          ListView.builder(

            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                              const TransactionsDetailCompleted()));;
                    },
                    minLeadingWidth: 40,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff6f5f5)),
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
                      style: CustomTextStyles.subHeadingStyle(size: 13),
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
                              size: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Divider(

                    height: 0,
                    thickness: 0.5,
                    color: TextFieldColors.borDerColor,
                  ),
                ],
              );
            },
            itemCount: 6,
          )
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap.verticalSpace(7.h),
            SvgPicture.asset('assets/Icons/nocustomer.svg'),
            Gap.verticalSpace(16.px),
            Text("No Transaction Found",
                style: CustomTextStyles.subHeadingStyle(
                    color: TextFieldColors.borDerColor,
                    size: 12,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );
    }
  }
}
