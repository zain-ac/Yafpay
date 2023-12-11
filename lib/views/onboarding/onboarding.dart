import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/utils/app_Images.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/auth/login/login_screen.dart';

import '../../utils/app_colors.dart';
import '../../view model/onBoarding_view_Model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  AnimationController? controller;
  Animation<double>? rotacion;
  final _controller = PageController();
  int selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(children: [
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/onboarding/img_1.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 27.h,
            left: 0.px,
            right: 0.px,
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'YAFPAY',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.greenColor,

                                  size: 21,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: ' Where Baking',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor,
                                  size: 21,

                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dreams Come to Life!',
                      style: CustomTextStyles.subHeadingStyle(

                          color: AppColors.whiteColor,
                          size: 21,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ])),
    ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(children: [
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/onboarding/onboarding_image2.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 27.h,
            left: 0.px,
            right: 0.px,
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Virtual Cards',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.greenColor,

                                  size: 21,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: ' Craft',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor,
                                  size: 23,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create, And Connect! ',
                      style: CustomTextStyles.subHeadingStyle(

                          color: AppColors.whiteColor,
                          size: 21,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ])),
    ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(children: [
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/onboarding/onboarding_image3.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 27.h,
            left: 0.px,
            right: 0.px,
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Streamline Your ',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor,

                                  size: 21,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: 'Transactions',
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.greenColor,
                                  size: 23,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Simplify, Secure, Succeed.',
                      style: CustomTextStyles.subHeadingStyle(

                          color: AppColors.whiteColor,
                          size: 21,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ])),
  ];

  @override
  Widget build(BuildContext context) {
    OnboardingProvider provider =
    Provider.of<OnboardingProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemCount: _pages.length,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
            top: 2.5.h,
            left: 0.px,
            right: 20.px,
            child: selectedIndex == 2
                ? Container()
                : Container(
                    height: 80.px,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()));
                            },
                            child: Text("Skip",
                                style: CustomTextStyles.subHeadingStyle(
                                    color: Colors.white)))
                      ],
                    ),
                  ),
          ),
          Positioned(
            bottom: 39.h,
            left: 0.px,
            right: 0.px,
            child: Center(
              child: DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: AppColors.whiteColor,
                  color: AppColors.dotUnselectedColor,
                  size: Size(8.px, 8.px),
                  spacing: EdgeInsets.only(right: 4.px),
                  activeSize: Size(11.px, 11.px),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.px),
                  ),
                ),
                dotsCount: _pages.length,
                position: selectedIndex,
              ),
            ),
          ),
          Positioned(
              bottom: 16.px,
              left: 0,
              right: 0,
              child: selectedIndex == 2
                  ? Container(
                      height: 6.h,
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 20.px),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.errorColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px))),
                          onPressed: () {
                            provider.setOnboardingStatus(false);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                          },
                          child: Text(
                            "Lets Start",
                            style: CustomTextStyles.subHeadingStyle(
                                color: AppColors.whiteColor),
                          )),
                    )
                  : Container(
                      height: 6.h,
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 20.px),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.errorColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px))),
                          onPressed: () {
                            setState(() {
                              selectedIndex = selectedIndex + 1;
                              _controller.jumpToPage(selectedIndex);
                            });
                          },
                          child: Text(
                            'Continue',
                            style: CustomTextStyles.subHeadingStyle(
                                color: AppColors.whiteColor),
                          )),
                    ))
        ],
      ),
    );
  }
}
