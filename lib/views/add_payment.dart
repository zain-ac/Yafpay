import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../helper/gap.dart';
import '../utils/app_Images.dart';
import '../utils/app_colors.dart';
import '../utils/custom_text_styles.dart';
import 'bottomnav/home/components/paymeny_links/donation_screen.dart';
import 'bottomnav/home/components/paymeny_links/single_charge.dart';
import 'bottomnav/home/components/paymeny_links/subscription_link_screen.dart';
import 'bottomnav/home/widgets/bottom_nav_tile.dart';
import 'bottomnav/transactions/controller/transactionController.dart';
class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
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
                                      'Create New Payment Link',
                                      style: CustomTextStyles.headingStyle(
                                          size: 24),
                                    ),
                                    Gap.verticalSpace(36.px),
                                    BottomNavTiles(
                                      text1: "Single Charge",
                                      text2:
                                          "Single charge allows you create payment for your customer. ",
                                      img: SvgPicture.asset(
                                        'assets/Icons/touch.svg',
                                      ),
                                      function: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const SingleCharge()));
                                      },
                                    ),
                                    Gap.verticalSpace(15.px),
                                    BottomNavTiles(
                                      text1: "Subscription Link",
                                      text2:
                                          "Create links where your customers can make your services.",
                                      img: SvgPicture.asset(
                                        'assets/Icons/dollar.svg',
                                      ),
                                      function: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const SubscriptionLinkSreen()));
                                      },
                                    ),
                                    Gap.verticalSpace(15.px),
                                    BottomNavTiles(
                                      text1: "Donation Page",
                                      text2:
                                          "Create really simple links where your donations easily pay. ",
                                      img: SvgPicture.asset(
                                        'assets/Icons/tag.svg',
                                      ),
                                      function: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const DonationScreen()));
                                      },
                                    ),
                                    Gap.verticalSpace(209.px),
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
