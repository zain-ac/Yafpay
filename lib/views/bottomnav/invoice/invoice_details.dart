import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';
import '../home/components/add_money/add_money.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({super.key});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
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
                  size: 23,
                )),
          ),
          SvgPicture.asset('assets/Icons/invoice_details.svg')
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 68.h,
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
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Invoice Detail',
                                    style: CustomTextStyles.heading(
                                        size: 24, fontWeight: FontWeight.w500),
                                  ),
                                  Gap.verticalSpace(7.px),
                                  const Text(
                                      "Following is details of your Invoice.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff848484))),
                                ],
                              ),
                              Spacer(),
                              SvgPicture.asset('assets/Icons/download.svg')
                            ],
                          ),
                          Gap.verticalSpace(25.px),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            // height: 10.h,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade200),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Invoice to:',
                                      style: CustomTextStyles.heading(
                                          size: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Usman Khan",
                                      style: CustomTextStyles.heading(
                                          size: 12,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Street 101,E-11/1 Islamabad",
                                      style: CustomTextStyles.heading(
                                          size: 12,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Invoice No:',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('  52121')
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Date:',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('       05/03/23')
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Due Date:',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('05/03/23')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Status:',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('         Unpaid')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Gap.verticalSpace(25.px),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            // height: 10.h,
                            decoration:
                                BoxDecoration(color: AppColors.primaryColor),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text(
                                          'SL.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          'Item Description',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          'Price  ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          'Qty',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          'Discount',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                // height: 10.h,

                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              'IPhone 12 pro',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              '23000  ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              '1  ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              '0',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              '23000.00',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Payment Info',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account No:',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Account Name:',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Bank Name:',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Sub Total:',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Tax:',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2324312242',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Usman Khan',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Mezaan Bank Limited',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '23000.00',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '0.00',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20
                    ),
                    child: Divider(
                      color: AppColors.primaryColor,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 5
                    ),
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Total',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Balance Due',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '0.00',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '23000.000',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h
                    ,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
