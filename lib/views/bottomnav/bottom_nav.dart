import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/views/bottomnav/home/components/balances.dart';
import 'package:sample/views/bottomnav/home/components/foriegn_transfer/foriegn_transfer.dart';
import 'package:sample/views/bottomnav/home/components/foriegn_transfer/widgets/foriegn_account_widget.dart';
import 'package:sample/views/bottomnav/transactions/transaction_screen.dart';
import 'benefits/benefits_screen.dart';
import 'home/components/paymeny_links/payment_link_list.dart';
import 'home/components/payment_link_list/qr_code_start.dart';
import 'home/components/referels.dart';
import 'home/home_page.dart';
import 'invoice/invoice_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  bool isPopupMenuVisible = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  // void _showPopupMenu(BuildContext context) {
  //   setState(() {
  //     isPopupMenuVisible = true;
  //   });
  //   final RenderBox overlay =
  //       Overlay.of(context).context.findRenderObject() as RenderBox;
  //
  //   showMenu(
  //     context: context,
  //     position: RelativeRect.fromRect(
  //       Rect.fromPoints(
  //           overlay.localToGlobal(overlay.size.center(const Offset(0, 52)),
  //               ancestor: overlay),
  //           overlay.localToGlobal(overlay.size.center(const Offset(105, 52)),
  //               ancestor: overlay)),
  //       Offset.zero & overlay.size,
  //     ),
  //     items: [
  //       PopupMenuItem<String>(
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => const PaymentLinkList()));
  //         },
  //         value: 'Payment Link',
  //         child: popUpMenu(
  //           text: 'Payment Link',
  //           icon: Icons.payments_sharp,
  //         ),
  //       ),
  //       PopupMenuItem<String>(
  //         onTap: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => const QRCodeStart()));
  //         },
  //         value: 'QR Pay',
  //         child: popUpMenu(
  //           text: 'QR Pay',
  //           icon: Icons.qr_code_2_sharp,
  //         ),
  //       ),
  //       PopupMenuItem<String>(
  //         onTap: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => const Balances()));
  //         },
  //         value: 'Balance',
  //         child: popUpMenu(
  //           text: 'Balance',
  //           icon: Icons.account_balance_wallet_sharp,
  //         ),
  //       ),
  //       PopupMenuItem<String>(
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => const ForeignTrasfer()));
  //         },
  //         value: 'option1',
  //         child: popUpMenu(
  //           text: 'Account and Report',
  //           icon: Icons.file_copy_outlined,
  //         ),
  //       ),
  //       PopupMenuItem<String>(
  //         onTap: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => const MyReferalls()));
  //         },
  //         value: 'option1',
  //         child: popUpMenu(
  //           text: 'Referels',
  //           icon: Icons.people_alt_outlined,
  //         ),
  //       ),
  //     ],
  //   ).then((value) {
  //     setState(() {
  //       isPopupMenuVisible = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              HomePage(),
              InvoiceScreen(),
              Center(
                child: Text('Not Implemented Yet'),
              ),
              BenefitsScreen(),
              TransactionScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            currentIndex: selectedIndex,
            backgroundColor: AppColors.whiteColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottomnav/home_unactive.svg'),
                activeIcon:
                    SvgPicture.asset('assets/bottomnav/home_active.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottomnav/invoice_unactive.svg'),
                activeIcon:
                    SvgPicture.asset('assets/bottomnav/invoice_active.svg'),
                label: 'Invoice',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    // _showPopupMenu(context); // Show the custom popup menu
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.red,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    SvgPicture.asset('assets/bottomnav/benefits_unactive.svg'),
                activeIcon:
                    SvgPicture.asset('assets/bottomnav/benefits_active.svg'),
                label: 'Benefits',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/bottomnav/transactions_unactive.svg',
                ),
                activeIcon:
                    SvgPicture.asset('assets/bottomnav/transaction_active.svg'),
                label: 'Transactions',
              ),
            ],
          ),
        ),
        if (isPopupMenuVisible)
          Container(
            height: 91.h,
            color:
                Colors.black.withOpacity(0.5), // Gray background with opacity
          ),
      ],
    );
  }
}
//
// class popUpMenu extends StatelessWidget {
//   String text;
//   IconData icon;
//
//   popUpMenu({
//     required this.text,
//     required this.icon,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             color: Colors.red.withOpacity(0.2),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: Icon(
//               icon,
//               color: Colors.red,
//             ),
//           ),
//         ),
//         Gap.horizontalSpace(5.px),
//         Text(text),
//       ],
//     );
//   }
// }
