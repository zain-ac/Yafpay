import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/views/bottomnav/home/components/yafpay_user/yafpay_user.dart';
import 'package:sample/views/user%20data/yafpaytag.dart';

import '../../../widgets/bottom_nav_tile.dart';
import '../../my_payee/account_proof.dart';
import '../../my_payee/download_account_statement.dart';

class AccountStatementWidget extends StatelessWidget {
  const AccountStatementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap.verticalSpace(15.px),
        BottomNavTiles(
          text1: "Get Statements",
          text2: "Send funds instantly to your friends using their tags. ",
          img: SvgPicture.asset(
            'assets/Icons/copy.svg',
          ),
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const DownloadAccountStatement()));
          },
        ),
        Gap.verticalSpace(15.px),
        BottomNavTiles(
          text1: "Get Account Proof",
          text2: "Choose from one of your beneficiary to make withdraw.",
          img: SvgPicture.asset(
            'assets/Icons/protection.svg',
          ),
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AccountProof()));
          },
        ),
        Gap.verticalSpace(30.px),
      ],
    );
  }
}
