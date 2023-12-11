import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/views/bottomnav/invoice/controller/invoice_controller.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';
import '../../new_updated_views/add_customer.dart';
import '../../new_updated_views/add_invoice_view.dart';
import 'invoice_details.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

// assets/Icons/invoice.svg
class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceController>(
      builder: (context, provider, child) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xffF24D4D),
                onPressed: () {
                  if (provider.secondContainer == true) {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCustomer()));
                  }else if(provider.firstContainer){


                    Navigator.push(context, MaterialPageRoute(builder: (_)=>AddInvoiceView()));
                  }
                },
                child: SvgPicture.asset('assets/Icons/plus.svg')),
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
                          AppImages.invoiceLogo,
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
                                              'Invoices',
                                              style: CustomTextStyles
                                                  .headingStyle(),
                                            ),
                                            Text(
                                              'There are your overall Invoices.',
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
                                    Gap.verticalSpace(30.px),
                                    Container(
                                        height: 30.px,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                provider.firstOnTap();
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 30.px,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: provider
                                                            .firstContainer
                                                        ? Color(0xffFEEDED)
                                                        : Colors.transparent),
                                                child: Text('invoice',
                                                    style: CustomTextStyles
                                                        .subHeadingStyle(
                                                            color: provider
                                                                    .firstContainer
                                                                ? AppColors
                                                                    .errorColor
                                                                : Color(
                                                                    0xff444444),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            size: 12)),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                provider.secondOnTap();
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 30.px,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: provider
                                                            .secondContainer
                                                        ? Color(0xffFEEDED)
                                                        : Colors.transparent),
                                                child: Text('customer',
                                                    style: CustomTextStyles
                                                        .subHeadingStyle(
                                                            color: provider
                                                                    .secondContainer
                                                                ? AppColors
                                                                    .errorColor
                                                                : Color(
                                                                    0xff444444),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            size: 12)),
                                              ),
                                            ),
                                          ],
                                        )),
                                    provider.firstContainer
                                        ? buildInvoiceView(provider)
                                        : buildCustomerView(provider),
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

  buildInvoiceView(InvoiceController provider) {
    if (provider.invoiceList.isNotEmpty) {
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => InvoiceDetails()));
                    },
                    minLeadingWidth: 40,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff6f5f5)),
                      child: Center(
                        child: SvgPicture.asset('assets/Icons/file.svg'),
                      ),
                    ),
                    title: Text(
                      '#32456',
                      style: CustomTextStyles.subHeadingStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      'Jhon smith',
                      style: CustomTextStyles.subHeadingStyle(size: 11),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          '\$${provider.invoiceList[index]}',
                          style: CustomTextStyles.subHeadingStyle(
                              color: AppColors.primaryColor,
                              size: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          index.isEven ? 'Draft' : "Paid",
                          style: CustomTextStyles.subHeadingStyle(
                              size: 13,
                              color: index.isEven
                                  ? Color(0xffFF9A6C)
                                  : AppColors.greenColor,
                              fontWeight: FontWeight.w400),
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
            itemCount: provider.invoiceList.length,
          ),
          Gap.verticalSpace(60.px),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Icons/noinvoiceData.svg'),
            Gap.verticalSpace(16.px),
            Text("No invoice Found",
                style: CustomTextStyles.subHeadingStyle(
                    color: TextFieldColors.borDerColor,
                    size: 12,
                    fontWeight: FontWeight.w500)),
            Gap.verticalSpace(7.h),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {},
                child: Text("Create Invoice",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ],
        ),
      );
    }
  }

  buildCustomerView(InvoiceController provider) {
    if (provider.invoiceList.isNotEmpty) {
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => InvoiceDetails()));
                    },
                    minLeadingWidth: 40,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff6f5f5)),
                      child: Center(
                        child: SvgPicture.asset('assets/Icons/person.svg'),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Jhon smith',
                          style: CustomTextStyles.subHeadingStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          '\$56',
                          style: CustomTextStyles.subHeadingStyle(
                              color: AppColors.primaryColor,
                              size: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '1 invoice',
                      style: CustomTextStyles.subHeadingStyle(size: 11),
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
          ),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Icons/nocustomer.svg'),
            Gap.verticalSpace(16.px),
            Text("No Customer Found",
                style: CustomTextStyles.subHeadingStyle(
                    color: TextFieldColors.borDerColor,
                    size: 12,
                    fontWeight: FontWeight.w500)),
            Gap.verticalSpace(7.h),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 6.h),
                    maximumSize: Size(100.w, 6.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {},
                child: Text("Create Invoice",
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.whiteColor))),
          ],
        ),
      );
    }
  }
}
