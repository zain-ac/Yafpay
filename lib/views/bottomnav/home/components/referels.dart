import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/home/components/add_money/add_money.dart';
import 'package:sample/views/bottomnav/home/components/cardview/top_up_funds.dart';
import 'package:sample/views/bottomnav/home/components/create_referalls.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/my_payee.dart';
import 'package:sample/views/bottomnav/transactions/components/transaction_details_screen.dart';
import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';

import '../../../../helper/gap.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_text_styles.dart';

class MyReferalls extends StatefulWidget {
  const MyReferalls({super.key});

  @override
  State<MyReferalls> createState() => _MyReferallsState();
}

class _MyReferallsState extends State<MyReferalls> {
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
                        SvgPicture.asset('assets/Icons/reffrels.svg'),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'My Referals',
                                          style:
                                              CustomTextStyles.headingStyle(),
                                        ),
                                        SvgPicture.asset(
                                            'assets/Icons/filter.svg'),
                                      ],
                                    ),
                                    Gap.verticalSpace(30.px),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 68.px),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: SvgPicture.asset(
                                                  'assets/Icons/nocustomer.svg')),
                                          Gap.verticalSpace(16.px),
                                          Text("No Referals Found",
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: TextFieldColors
                                                          .borDerColor,
                                                      size: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                    Gap.verticalSpace(130.px),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100.w, 6.h),
                                            maximumSize: Size(100.w, 6.h),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            backgroundColor:
                                                AppColors.buttonColor),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CreateReferalls()));
                                        },
                                        child: Text("Create Invoice",
                                            style: CustomTextStyles
                                                .subHeadingStyle(
                                                    color:
                                                        AppColors.whiteColor))),
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
}
