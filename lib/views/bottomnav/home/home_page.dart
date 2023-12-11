import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/view%20model/auth_view_model.dart';
import 'package:sample/views/bottomnav/home/components/My_Payee/my_payee.dart';
import 'package:sample/views/bottomnav/home/components/create_tag.dart/create_tag.dart';
import 'package:sample/views/bottomnav/home/components/foriegn_transfer/foriegn_transfer.dart';
import 'package:sample/views/bottomnav/home/components/yafpay_user/yafpay_user.dart';
import 'package:sample/views/new%20views/new_page.dart';
import 'package:sample/views/notification/notification_screen.dart';
import 'package:sample/views/profile/profile_page.dart';

import 'components/cardview/mycards.dart';
import 'components/add_money/add_money.dart';
import 'components/transaction_detail_completed.dart';
import 'components/transactions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, value, child) {
        return  Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.primaryColor,
                  child: Column(children: [
                    Gap.verticalSpace(8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap.horizontalSpace(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$25,390.50',
                              style: CustomTextStyles.heading(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap.verticalSpace(3.px),
                            Text(
                              'Available Balance',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor),
                            )
                          ],
                        ),
                        Gap.horizontalSpace(3.w),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'USD',
                                style: CustomTextStyles.subHeadingStyle(
                                    size: 14, color: AppColors.whiteColor),
                              ),
                              Gap.horizontalSpace(1.w),
                              SvgPicture.asset('assets/Icons/dropdown.svg')
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const NotificationScreen()));
                            },
                            child: const Icon(
                              Icons.notifications_active_rounded,
                              color: Colors.white,
                              size: 30,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const NewPage()));
                            },
                            child: const Icon(
                              Icons.document_scanner_outlined,
                              color: Colors.white,
                              size: 30,
                            )),

                        Gap.horizontalSpace(10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ProfilePage()));
                          },
                          child:  CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.grey.shade200,
                            child: Center(
                              child: Text("${value.userData!.user!.firstName![0]+value.userData!.user!.lastName![0]}",style: CustomTextStyles.headingStyle(),),
                            ),
                            // backgroundImage:
                            //     AssetImage('assets/images/userimage.png'),
                          ),
                        ),
                        Gap.horizontalSpace(20),
                      ],
                    ),
                    Gap.verticalSpace(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customContainer(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const YafpayUser()));
                            },
                            image: 'assets/images/yafpay_user.svg',
                            text: 'Yafpay\nUser'),
                        Gap.horizontalSpace(6.w),
                        customContainer(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreateTags()));
                            },
                            image: 'assets/images/create_tag.svg',
                            text: 'Create\nTag'),
                        Gap.horizontalSpace(6.w),
                        customContainer(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ForeignTrasfer()));
                            },
                            image: 'assets/images/foriegn_transfer.svg',
                            text: 'Account\nDetails'),
                        Gap.horizontalSpace(6.w),
                        customContainer(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MyPayee()));
                            },
                            image: 'assets/images/my_payee.svg',
                            text: 'My\nPayee'),
                        Gap.horizontalSpace(6.w),
                        customContainer(
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const AddMoney()));
                            },
                            image: 'assets/images/add_money.svg',
                            text: 'Add\nMoney'),
                      ],
                    ),
                    Gap.verticalSpace(6.h),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            children: [
                              Gap.verticalSpace(2.h),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Virtual Cards',
                                    style: CustomTextStyles.headingStyle(),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const MyCards()));
                                      },
                                      child: SvgPicture.asset(
                                          'assets/Icons/next_arrow.svg'))
                                ],
                              ),
                              Gap.verticalSpace(1.h),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (context, index) {

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const MyCards()));
                                    },
                                    child: SizedBox.fromSize(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 7.h,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Hero(
                                                  tag: "a",
                                                  child: Image.asset(
                                                    'assets/images/VIRTUAL_CARD.png',
                                                    height: 60.px,
                                                  ),
                                                ),
                                                Gap.horizontalSpace(4.w),
                                                SizedBox(
                                                  height: 7.h,
                                                  width: 57.w,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Virtual Cards',
                                                        style: CustomTextStyles
                                                            .subHeadingStyle(
                                                            color: AppColors
                                                                .primaryColor,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            size: 16),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                              "4577 4589 ****",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.w400,
                                                              )),
                                                          const Spacer(),
                                                          Text(
                                                            '\$25,390.50',
                                                            style: CustomTextStyles
                                                                .subHeadingStyle(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                size: 17),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          index == 1
                                              ? Container()
                                              : const Divider(
                                            thickness: 0.5,
                                            color:
                                            TextFieldColors.borDerColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Gap.verticalSpace(1.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recent Transactions',
                                      style: CustomTextStyles.headingStyle(),
                                    ),
                                    TextButton(
                                      child: Text(
                                        'see all',
                                        style: CustomTextStyles.headingStyle(
                                            size: 14, fontWeight: FontWeight.w500),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                const Transactions()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
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
                                              borderRadius:
                                              BorderRadius.circular(8),
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
                                      ),
                                      const Divider(
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
                          ),
                        )
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        );
      },

    );
  }

  Widget customContainer(
      {required String image,
      required VoidCallback callback,
      required String text}) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: [
          Container(
            width: 50.px,
            height: 50.px,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor),
            child: Center(child: SvgPicture.asset(image.toString())),
          ),
          Gap.verticalSpace(10.px),
          Text(
            text,
            textAlign: TextAlign.center,
            style: CustomTextStyles.subHeadingStyle(
                size: 14, color: AppColors.whiteColor, height: 1),
          )
        ],
      ),
    );
  }
}
