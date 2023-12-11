import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_Images.dart';
import 'package:sample/view%20model/auth_view_model.dart';
import 'package:sample/view%20model/onBoarding_view_Model.dart';
import 'package:sample/views/auth/login/login_screen.dart';
import 'package:sample/views/bottomnav/new_nav.dart';
import 'package:sample/views/onboarding/onboarding.dart';

import '../../model/registration_response.dart';
import '../../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if (Provider.of<AuthViewModel>(context, listen: false).isLoggedIn) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const NewNav(),
  //         ),
  //       );
  //     }else if( Provider.of<OnboardingProvider>(context).showOnboarding){
  //       Navigator.pushReplacement(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => const LoginScreen(),
  //                   ),
  //                 );
  //     }else{
  //       Navigator.pushReplacement(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => const OnBoarding(),
  //                   ),);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    bool showOnboarding = Provider.of<OnboardingProvider>(context).showOnboarding;
    // LoginResult? loginChk = Provider.of<AuthViewModel>(context).;
    //
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        if(  showOnboarding == false){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoarding(),
            ),
          );
      }


    //
    //
    });


    // Navigate accordingly

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap.verticalSpace(28.h),
          Center(
            child: SvgPicture.asset(AppImages.splashLogo),
          ),
          Gap.verticalSpace(
            25.h,
          ),
          Image.asset(
            AppImages.loading,
            width: 12.w,
          )
        ],
      ),
    );
  }
}
