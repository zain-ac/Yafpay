import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';

import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class QRCodeStart extends StatefulWidget {
  const QRCodeStart({super.key});

  @override
  State<QRCodeStart> createState() => _QRCodeStartState();
}

class _QRCodeStartState extends State<QRCodeStart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, provider, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Container(
              height: 100.h,
              width: double.infinity,
              color: const Color(0xFF112143),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 57),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
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
                        Gap.verticalSpace(62.px),
                        const Text(
                          "Start Scanning",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "The app will require access to the camera.",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffebebeb),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/images/qr_code.svg'),
                    Container(
                      height: 6.h,
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 20.px),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.errorColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px))),
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            'Start Scaning',
                            style: CustomTextStyles.subHeadingStyle(
                                color: AppColors.whiteColor),
                          )),
                    ),
                  ],
                ),
              )),
        ));
      },
    );
  }
}
