import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/helper/text_helper.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/send_to_beneficiary.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/send_to_new_recipient.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/donation.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/donation_screen.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/payment_link_list_detail.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/single_charge.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/subscription_link.dart';
import 'package:sample/views/bottomnav/home/components/paymeny_links/subscription_link_screen.dart';
import 'package:sample/views/bottomnav/home/components/yafpay_user/yafpay_user.dart';
import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';
import 'package:sample/views/pay_details.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_Images.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/custom_text_styles.dart';
import '../../../../add_payment.dart';
import '../../widgets/bottom_nav_tile.dart';

class PaymentLinkList extends StatefulWidget {
  const PaymentLinkList({super.key});

  @override
  State<PaymentLinkList> createState() => _PaymentLinkListState();
}

class _PaymentLinkListState extends State<PaymentLinkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
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
                                'Payment Link List',
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
                      const Text("There are your overall Invoices.",
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
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PayDetails()));
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
                                    'Card Payment',
                                    style: CustomTextStyles.subHeadingStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                  subtitle:  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          canLaunchUrl(Uri.parse('https://flutterwave.com/us/'));
                                          TextHelper.launchUrl('https://flutterwave.com/us/');
                                        },
                                        child: Text(
                                          "https://flutterwave.compay...",
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff848484),
                                            height: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          TextHelper.launchUrl('https://flutterwave.com/us/');
                                        },
                                        child: Icon( Icons.copy,
                                          color: Color(0xff36BC6C),
                                          size: 18,),
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )),
                              const Divider(
                                thickness: 0.5,
                                color: TextFieldColors.borDerColor,
                              ),
                            ],
                          );
                        },
                        itemCount: 6,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddPaymentScreen()));
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.add,
          size: 37,
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<TransactionController>(
  //     builder: (context, provider, child) {
  //       return Scaffold(
  //           backgroundColor: Colors.white,
  //           body: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: double.infinity,
  //                   color: AppColors.primaryColor,
  //                   child: Column(
  //                     children: [
  //                       Gap.verticalSpace(8.h),
  //                       SvgPicture.asset(
  //                         AppImages.transactionLogo,
  //                         width: 40.w,
  //                       ),
  //                       Gap.verticalSpace(25.99.px),
  //                       Column(
  //                         children: [
  //                           Container(
  //                               padding:
  //                                   EdgeInsets.symmetric(horizontal: 20.px),
  //                               decoration: const BoxDecoration(
  //                                   color: Colors.white,
  //                                   borderRadius: BorderRadius.only(
  //                                       topRight: Radius.circular(30),
  //                                       topLeft: Radius.circular(30))),
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Gap.verticalSpace(20.px),
  //                                   Text(
  //                                     'Create New Payment Link',
  //                                     style: CustomTextStyles.headingStyle(
  //                                         size: 24),
  //                                   ),
  //                                   Gap.verticalSpace(36.px),
  //                                   BottomNavTiles(
  //                                     text1: "Single Charge",
  //                                     text2:
  //                                         "Single charge allows you create payment for your customer. ",
  //                                     img: SvgPicture.asset(
  //                                       'assets/Icons/touch.svg',
  //                                     ),
  //                                     function: () {
  //                                       Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (_) =>
  //                                                   const SingleCharge()));
  //                                     },
  //                                   ),
  //                                   Gap.verticalSpace(15.px),
  //                                   BottomNavTiles(
  //                                     text1: "Subscription Link",
  //                                     text2:
  //                                         "Create links where your customers can make your services.",
  //                                     img: SvgPicture.asset(
  //                                       'assets/Icons/dollar.svg',
  //                                     ),
  //                                     function: () {
  //                                       Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (_) =>
  //                                                   const SubscriptionLinkSreen()));
  //                                     },
  //                                   ),
  //                                   Gap.verticalSpace(15.px),
  //                                   BottomNavTiles(
  //                                     text1: "Donation Page",
  //                                     text2:
  //                                         "Create really simple links where your donations easily pay. ",
  //                                     img: SvgPicture.asset(
  //                                       'assets/Icons/tag.svg',
  //                                     ),
  //                                     function: () {
  //                                       Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (_) =>
  //                                                   const DonationScreen()));
  //                                     },
  //                                   ),
  //                                   Gap.verticalSpace(209.px),
  //                                 ],
  //                               )),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ));
  //     },
  //   );
  // }
}
