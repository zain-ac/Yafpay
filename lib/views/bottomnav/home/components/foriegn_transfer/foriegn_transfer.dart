import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import 'package:sample/utils/custom_text_styles.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

import 'controller/account_report_controller.dart';
import 'widgets/account_statement_widget.dart';
import 'widgets/foriegn_account_widget.dart';

class ForeignTrasfer extends StatefulWidget {
  const ForeignTrasfer({super.key});

  @override
  State<ForeignTrasfer> createState() => _ForeignTrasferState();
}

class _ForeignTrasferState extends State<ForeignTrasfer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountReportController>(
        builder: (context, viewModel, child) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(
                          'Account And Report',
                          style: CustomTextStyles.heading(
                              size: 24, fontWeight: FontWeight.w500),
                        ),
                        Gap.verticalSpace(5.px),
                        const Text("Following are the detail of your account. ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff848484))),
                        Gap.verticalSpace(15.px),
                        SizedBox(
                            height: 30.px,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.foreignAccountActive();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              viewModel.foreignAccount ? 0 : 0),
                                      height: 30.px,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: viewModel.foreignAccount
                                              ? 20
                                              : 10,
                                          vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: viewModel.foreignAccount
                                              ? const Color(0xffFEEDED)
                                              : Colors.transparent),
                                      child: Text('Account Details',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  color: viewModel
                                                          .foreignAccount
                                                      ? AppColors.errorColor
                                                      : const Color(0xff444444),
                                                  fontWeight: FontWeight.w400,
                                                  size: 12)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.accountStatementActive();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 0),
                                      height: 30.px,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: viewModel.accountStatement
                                              ? 20
                                              : 10,
                                          vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: viewModel.accountStatement
                                              ? const Color(0xffFEEDED)
                                              : Colors.transparent),
                                      child: Text('Account Statement',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  color: viewModel
                                                          .accountStatement
                                                      ? AppColors.errorColor
                                                      : const Color(0xff444444),
                                                  fontWeight: FontWeight.w400,
                                                  size: 12)),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Gap.verticalSpace(10.px),
                        viewModel.foreignAccount
                            ? const ForiegnAccountWidget()
                            : Container(),
                        viewModel.accountStatement
                            ? const AccountStatementWidget()
                            : Container(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
