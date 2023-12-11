import 'dart:io';

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/transactions/transaction_screen.dart';

import '../../helper/gap.dart';
import 'benefits/benefits_screen.dart';
import 'home/components/balances.dart';
import 'home/components/foriegn_transfer/foriegn_transfer.dart';
import 'home/components/payment_link_list/qr_code_start.dart';
import 'home/components/paymeny_links/payment_link_list.dart';
import 'home/components/referels.dart';
import 'home/home_page.dart';
import 'invoice/invoice_screen.dart';

class NewNav extends StatefulWidget {
  const NewNav({super.key});

  @override
  State<NewNav> createState() => _NewNavState();
}

class _NewNavState extends State<NewNav> {
  int _currentIndex = 0;
  bool y = false;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: [
              HomePage(),
              InvoiceScreen(),
              BenefitsScreen(),
              TransactionScreen(),
            ],
          ),
          backgroundColor: Colors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: InkWell(
            onTap: () {
              y = !y;
              setState(() {});
            },
            child: y
                ? SvgPicture.asset('assets/bottomnav/close_icon.svg')
                : SvgPicture.asset('assets/bottomnav/add-button.svg'),
          ),
          bottomNavigationBar: BottomAppBar(
            // notchMargin: 5.0,
            // shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(0);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _currentIndex == 0
                              ? SvgPicture.asset(
                                  'assets/bottomnav/home_active.svg')
                              : SvgPicture.asset(
                                  'assets/bottomnav/home_unactive.svg'),
                          Text(
                            'Home',
                            style: CustomTextStyles.subHeadingStyle(
                                size: _currentIndex == 3 ? 12 : 11,
                                color: _currentIndex == 0
                                    ? Color(0xff112143)
                                    : Color(0xff848484)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 20.w,
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(1);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _currentIndex == 1
                              ? SvgPicture.asset(
                                  'assets/bottomnav/invoice_active.svg')
                              : SvgPicture.asset(
                                  'assets/bottomnav/invoice_unactive.svg'),
                          Text(
                            'Invoice',
                            style: CustomTextStyles.subHeadingStyle(
                                size: _currentIndex == 3 ? 12 : 11,
                                color: _currentIndex == 1
                                    ? Color(0xff112143)
                                    : Color(0xff848484)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 20.w,
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(2);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _currentIndex != 2
                              ? SvgPicture.asset(
                                  'assets/bottomnav/benefits_unactive.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/bottomnav/benefits_active.svg'),
                          Text(
                            'Benefts',
                            style: CustomTextStyles.subHeadingStyle(
                                size: _currentIndex == 3 ? 11 : 10,
                                color: _currentIndex == 2
                                    ? Color(0xff112143)
                                    : Color(0xff848484)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 10),
                  width: 20.w,
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(3);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _currentIndex != 3
                              ? SvgPicture.asset(
                                  'assets/bottomnav/transactions_unactive.svg')
                              : SvgPicture.asset(
                                  'assets/bottomnav/transaction_active.svg'),
                          Text(
                            'Transactons',
                            style: CustomTextStyles.subHeadingStyle(
                                size: _currentIndex == 3 ? 11 : 10,
                                color: _currentIndex == 3
                                    ? Color(0xff112143)
                                    : Color(0xff848484)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (y)
          Positioned(
            bottom: Platform.isAndroid ? 100 : 130,
            left: 20.w,
            right: 20.w,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PopUp(
                      icon: 'assets/bottomnav/payment.svg',
                      text: 'Payment Link',
                      voidCallback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentLinkList())).then((value) {
                                  y = false;
                                  setState(() {

                                  });
                        });
                      },
                    ),
                    PopUp(
                      icon: 'assets/bottomnav/account.svg',
                      text: 'QR Pay',
                      voidCallback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRCodeStart())).then((value) {
                          y = false;
                          setState(() {

                          });
                        });
                      },
                    ),
                    PopUp(
                      icon: 'assets/bottomnav/balance.svg',
                      text: 'Balance',
                      voidCallback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Balances())).then((value) {
                          y = false;
                          setState(() {

                          });
                        });
                      },
                    ),
                    PopUp(
                      icon: 'assets/bottomnav/refral.svg',
                      text: 'Account & Report',
                      voidCallback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForeignTrasfer())).then((value) {
                          y = false;
                          setState(() {

                          });
                        });
                      },
                    ),
                    PopUp(
                      icon: 'assets/bottomnav/payment_link.svg',
                      text: 'Referrals',
                      voidCallback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyReferalls())).then((value) {
                          y = false;
                          setState(() {

                          });
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class PopUp extends StatelessWidget {
  String text;
  String icon;
  VoidCallback voidCallback;

  PopUp({
    required this.text,
    required this.icon,
    required this.voidCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: SvgPicture.asset(
              icon,
            ),
          ),
          Gap.horizontalSpace(5.px),
          Text(text),
        ],
      ),
    );
  }
}
