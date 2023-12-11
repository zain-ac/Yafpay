import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../helper/gap.dart';
import '../helper/public_helper.dart';
import '../utils/app_colors.dart';
import '../utils/custom_text_styles.dart';
import 'bottomnav/home/components/cardview/add_card.dart';
import 'bottomnav/home/components/transaction_detail_completed.dart';
import 'bottomnav/home/components/transactions.dart';

class PaymentInformationScreen extends StatefulWidget {
  const PaymentInformationScreen({super.key});

  @override
  State<PaymentInformationScreen> createState() =>
      _PaymentInformationScreenState();
}

class _PaymentInformationScreenState extends State<PaymentInformationScreen> {
  bool switchVal = false;
  bool cardChange = false;
  void _showMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        button.localToGlobal(Offset.zero).dx,
        button.localToGlobal(Offset.zero).dy + button.size.height,
        button.localToGlobal(Offset.zero).dx + 50.0,
        button.localToGlobal(Offset.zero).dy + button.size.width + 200.0,
      ),
      items: <PopupMenuItem<String>>[


        PopupMenuItem<String>(
          value: 'Edit',
          child: Text('Link', style: TextStyle(fontSize: 12.0)), // Adjust text size
        ),
        PopupMenuItem<String>(
          value: 'Deactivate Link',
          child: Text('Deactivate Link', style: TextStyle(fontSize: 12.0)), // Adjust text size
        ),
        PopupMenuItem<String>(
          value: 'Download QR',
          child: Text('Download QR', style: TextStyle(fontSize: 12.0)), // Adjust text size
        ),

        PopupMenuItem<String>(
          value: 'Delete',
          child: Text('Delete', style: TextStyle(fontSize: 12.0,color: Colors.red)), // Adjust text size
        ),
      ],
    ).then((value) {
      if (value != null) {
        // Handle the selected action here
        switch (value) {
          case 'Edit':
          // Handle Edit action
            break;
          case 'Deactivate':
          // Handle Deactivate action
            break;
          case 'Link':
          // Handle Link action
            break;
          case 'Download QR':
          // Handle Download QR action
            break;
          case 'Delete':
          // Handle Delete action
            break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Column(children: [
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
                              'Payment Links',
                              style: CustomTextStyles.headingStyle(),
                            ),
                            Gap.verticalSpace(3.px),
                            Text(
                              'Some information about this payment link',
                              style: CustomTextStyles.subHeadingStyle(),
                            ),
                            Gap.verticalSpace(5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CFA0.00',
                                  style: CustomTextStyles.headingStyle(),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '29th September 2023',
                                      style: CustomTextStyles.subHeadingStyle(),
                                    ),
                                    Gap.verticalSpace(1.h),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.greenColor,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          'Active',
                                          style: CustomTextStyles.headingStyle(
                                              color: Colors.black, size: 13),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            Gap.verticalSpace(2.h),
                            Container(
                              width: double.infinity,
                              child: Card(
                                color: Colors.grey[50],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Gap.verticalSpace(1.5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Page Name',
                                          style: TextStyle(
                                              color: Colors.blueGrey[300],
                                              fontSize: 13.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Card Payments',
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Divider(
                                        color: Colors.blueGrey[100],
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Page Type',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueGrey[300],
                                                      fontSize: 13.5),
                                                ),
                                                SizedBox(
                                                  height: 10.px,
                                                ),
                                                Text(
                                                  'Single Charge',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.5),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Date Created',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueGrey[300],
                                                      fontSize: 13.5),
                                                ),
                                                SizedBox(
                                                  height: 10.px,
                                                ),
                                                Text(
                                                  '29th September 2023',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.5),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Divider(
                                        color: Colors.blueGrey[100],
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Payment URL',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueGrey[300],
                                                      fontSize: 13.5),
                                                ),
                                                SizedBox(
                                                  height: 10.px,
                                                ),
                                                Container(
                                                  width: 40.w,
                                                  child: Text(
                                                    'https://app.flutterflow.io/project/login-5mspiw?tab=uiBuilder&page=HomePage',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8))),
                                                onPressed: () {},
                                                child: Text(
                                                  'Copy link',
                                                  style: CustomTextStyles
                                                      .headingStyle(
                                                          color: Colors.white,
                                                          size: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Divider(
                                        color: Colors.blueGrey[100],
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            onPressed: () {
                                              _showMenu(context);
                                            },
                                            child: Text(
                                              'Options',
                                              style:
                                                  CustomTextStyles.headingStyle(
                                                      color: Colors.white,
                                                      size: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Divider(
                                        color: Colors.blueGrey[100],
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Date Created',
                                              style: TextStyle(
                                                  color: Colors.blueGrey[300],
                                                  fontSize: 13.5),
                                            ),
                                            SizedBox(
                                              height: 10.px,
                                            ),
                                            Text(
                                              '29th September 2023',
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.px,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.px,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Transactions',
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
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
