import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/views/bottomnav/home/components/cardview/topup.dart';
import 'package:sample/views/bottomnav/home/components/cardview/withdraw.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/my_payee.dart';
import 'package:sample/views/bottomnav/home/components/transaction_detail_completed.dart';
import 'package:sample/views/card_setting.dart';

import '../../../../../helper/gap.dart';
import '../../../../../helper/public_helper.dart';
import '../../../../../utils/app_Images.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/custom_text_styles.dart';
import '../transaction_detail_failed.dart';
import 'add_card.dart';
import 'top_up_funds.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  bool switchVal = false;
  bool cardChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffF24D4D),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AddCard()));
          },
        ),
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Gap.verticalSpace(4.h),
                    PublicHelper().backButton(
                      back: true,
                      context: context,
                    ),
                    Gap.verticalSpace(5.h),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap.verticalSpace(2.5.h),
                              Text(
                                'My Cards',
                                style: CustomTextStyles.headingStyle(),
                              ),
                              Gap.verticalSpace(3.px),
                              Text(
                                'Your Card Details Are Below!',
                                style: CustomTextStyles.subHeadingStyle(),
                              ),
                              Gap.verticalSpace(35.px),
                              SizedBox(
                                // color: Colors.red,
                                height: 25.h,
                                child: Hero(
                                  tag: 'a',
                                  child: Swiper(
                                    // scale: 0.4,
                                    loop: false,
                                    viewportFraction: 0.95,
                                    // shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          cardChange =! cardChange;
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(right: 20),
                                          padding: EdgeInsets.only(left: 6.w),
                                          height: 8.h,
                                          width: 82.w,
                                          decoration:  BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    cardChange?'assets/dummy/img_2.png':
                                                      'assets/Icons/card.png'))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 9.h,
                                              ),
                                              Text(
                                                cardChange?"1233 4212 4124 5234":
                                                '\$25,390.50',
                                                style: CustomTextStyles.heading(
                                                    color: AppColors.whiteColor,
                                                    size:  cardChange?20:23,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: cardChange?8.h:7.h,
                                              ),
                                              Row(
                                                children: [
                                                  cardChange?   Text(
                                                    cardChange?'03/21':
                                                    'Alien Pixels',
                                                    style: CustomTextStyles
                                                        .subHeadingStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        size: 17,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ):Container(),
                                                 cardChange?SizedBox(width: 16.w,): Gap.horizontalSpace(20.w),
                                                  Text(
                                                    cardChange?'111':
                                                    'Alien Pixels',
                                                    style: CustomTextStyles
                                                        .subHeadingStyle(
                                                            color: AppColors
                                                                .whiteColor,
                                                            size: 17,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Gap.verticalSpace(3.5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TopUp()));
                                    },
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icons/red-con.svg',
                                          width: 12.w,
                                        ),
                                        Gap.verticalSpace(.5.h),
                                        Text(
                                          'Top Up',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  color:
                                                      AppColors.primaryColor),
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
                                              builder: (_) => const WithDrawPage()));
                                    },
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icons/withdraw.svg',
                                          width: 12.w,
                                        ),
                                        Gap.verticalSpace(.5.h),
                                        Text(
                                          'Withdraw',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  color:
                                                      AppColors.primaryColor),
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
                                              builder: (_) => const CardSetting()));
                                    },
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icons/setting.svg',
                                          width: 12.w,
                                        ),
                                        Gap.verticalSpace(.5.h),
                                        Text(
                                          'Settings',
                                          style:
                                          CustomTextStyles.subHeadingStyle(
                                              color:
                                              AppColors.primaryColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Gap.verticalSpace(3.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Freeze Card',
                                    style: CustomTextStyles.subHeadingStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Switch(
                                      inactiveTrackColor:
                                          TextFieldColors.borDerColor,
                                      trackOutlineColor:
                                          const MaterialStatePropertyAll(
                                              Colors.transparent),
                                      activeColor: AppColors.primaryColor,
                                      inactiveThumbColor: AppColors.whiteColor,
                                      activeTrackColor:
                                          TextFieldColors.borDerColor,
                                      value: switchVal,
                                      onChanged: (value) {
                                        setState(() {
                                          switchVal = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Gap.verticalSpace(1.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card Details',
                                    style: CustomTextStyles.subHeadingStyle(
                                        color: AppColors.primaryColor),
                                  ),
                              SvgPicture.asset('assets/Icons/copy_.svg')
                                ],
                              ),
                              Gap.verticalSpace(1.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Recent Transactions',
                                  style:
                                      CustomTextStyles.headingStyle(size: 22),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final List<Function> tileActions = [
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TransactionsDetailFailed()));
                                    },
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TransactionsDetailCompleted()));
                                    },
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TransactionsDetailCompleted()));
                                    },
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TransactionsDetailCompleted()));
                                    },
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TransactionsDetailCompleted()));
                                    },
                                    () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TransactionsDetailCompleted()));
                                    },
                                  ];

                                  return ListTile(
                                    onTap: () {
                                      // Execute the appropriate function based on the index
                                      if (index < tileActions.length) {
                                        tileActions[index]();
                                      }
                                    },
                                    minLeadingWidth: 40,
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xfff6f5f5)),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            'assets/images/trnasaction_card.svg'),
                                      ),
                                    ),
                                    title: Text(
                                      'Groceries',
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
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  color: index == 0
                                                      ? AppColors.errorColor
                                                      : AppColors.greenColor,
                                                  size: 17,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Sep 30',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 13,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 6,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );

  }
}
