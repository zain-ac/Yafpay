import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/views/bottomnav/home/components/foriegn_transfer/widgets/account_dropdown_text.dart';

class ForiegnAccountWidget extends StatelessWidget {
  const ForiegnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Icons/uk.png',
                  width: 30,
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "GBP Account ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff142445),
                      height: 27 / 20,
                    ),
                  ),
                ),
                Icon(
                  Icons.copy,
                  color: Colors.lightGreen,
                  size: 18,
                )
              ],
            ),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 2.2.h,
            width: 15.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                    const Color.fromARGB(255, 133, 206, 168).withOpacity(0.2)),
            child: const Text(
              "New",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xff41b985),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "Account Holder",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                AccountDropdownText(
                  color: AppColors.primaryColor,
                  text: "Account Holder",
                  size: 12,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "Account Number",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                AccountDropdownText(
                  color: AppColors.primaryColor,
                  text: "987654567",
                  size: 12,
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: TextFieldColors.borDerColor,
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "IBAN",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                AccountDropdownText(
                  color: AppColors.primaryColor,
                  text: "NASUD8JASNQ1N1KLSA90",
                  size: 12,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "Swift Code",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                AccountDropdownText(
                  color: AppColors.primaryColor,
                  text: "ASDAJNEAAS",
                  size: 12,
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: TextFieldColors.borDerColor,
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "Sort Code",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                AccountDropdownText(
                  color: AppColors.primaryColor,
                  text: "0213213",
                  size: 12,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "Bank Name",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                AccountDropdownText(
                  color: AppColors.primaryColor,
                  text: "CLEAR JUNC TION LIMITED",
                  size: 12,
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: TextFieldColors.borDerColor,
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDropdownText(
                  color: const Color(0xffaaaaaa),
                  text: "Address",
                  size: 13,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '4th Floor Imperial House, 15 Kingways London, Uk\n W244B6UN',
                  // textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    // fontFamily: "Nunito",
                    fontSize: 12,

                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 20.px,
        ),
        Container(
          height: 23.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: const Color(0xffFDF9F3),
              borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Please Note:"),
                Text(
                  "   •   This account only support payment via FPS, AND\n       CHAPS payment scheme from SSA.\n   •   Account can only recieve funds in the GBP.\n   •  You’ll be charged a 1% fee on payments made into    \n       this account. \n   •  Incoming payments can take between 1-3 days\n       depending on the payment scheme used by the\n       sending bank. ",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff161616),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
