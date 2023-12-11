import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_Images.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/add_money/add_money.dart';
import 'package:sample/views/bottomnav/home/components/cardview/top_up_funds.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/my_payee.dart';
import 'package:sample/views/bottomnav/transactions/components/transaction_details_screen.dart';
import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';
import 'package:sample/views/new_updated_views/swap_funds.dart';

class Balances extends StatefulWidget {
  const Balances({super.key});

  @override
  State<Balances> createState() => _BalancesState();
}

class _BalancesState extends State<Balances> {
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
                        Gap.verticalSpace(25.px),
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
                        SvgPicture.asset('assets/Icons/balances.svg'),
                        Gap.verticalSpace(15.99.px),
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.px, vertical: 20),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Balances',
                                      style: CustomTextStyles.headingStyle(),
                                    ),
                                    Gap.verticalSpace(5.px),
                                    Text(
                                      'Following are the detail of your balances.',
                                      style: CustomTextStyles.subHeadingStyle(
                                          size: 14),
                                    ),
                                    Gap.verticalSpace(35.px),
                                    ContainerTextField(
                                      svg: SvgPicture.asset(
                                          'assets/Icons/calendar.svg'),
                                      t1: "USD Dollar",
                                      child: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Color(0xff3b3b3b),
                                      ),
                                    ),
                                    Gap.verticalSpace(15.px),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        BalanceContainer(),
                                        BalanceContainer()
                                      ],
                                    ),
                                    Gap.verticalSpace(25.px),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const TopUpFunds()));
                                          },
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Icons/red-con.svg',
                                                width: 12.w,
                                              ),
                                              Gap.verticalSpace(.5.h),
                                              Text(
                                                'Deposit',
                                                style: CustomTextStyles
                                                    .subHeadingStyle(
                                                        color: AppColors
                                                            .primaryColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        Gap.horizontalSpace(10.w),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const MyPayee()));
                                          },
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Icons/send_con.svg',
                                                width: 12.w,
                                              ),
                                              Gap.verticalSpace(.5.h),
                                              Text(
                                                'Send',
                                                style: CustomTextStyles
                                                    .subHeadingStyle(
                                                        color: AppColors
                                                            .primaryColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        Gap.horizontalSpace(10.w),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const SwapFunds()));
                                          },
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Icons/swap.svg',
                                                width: 12.w,
                                              ),
                                              Gap.verticalSpace(.5.h),
                                              Text(
                                                'Swap',
                                                style: CustomTextStyles
                                                    .subHeadingStyle(
                                                        color: AppColors
                                                            .primaryColor),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap.verticalSpace(30.px),
                                    Text(
                                      'Balance Activity',
                                      style: CustomTextStyles.headingStyle(),
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
    if (provider.transactionList.isEmpty) {
      return Column(
        children: [
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
                                  const TransactionDetailsScreen()));
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
                  const Divider(
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
        padding: EdgeInsets.symmetric(vertical: 68.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/Icons/nocustomer.svg')),
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

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffF2F3F4)),
      height: 13.h,
      width: 40.w,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "\$56,789.09",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff142445),
              height: 20 / 20,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Available USD Balance",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff848484),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
