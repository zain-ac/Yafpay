import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/service/services.dart';
import 'package:sample/utils/app_Images.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/bottomnav/new_nav.dart';

import '../../../view model/auth_view_model.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool authenticated = false;
  bool obscureText1 = true;
  final BiometricSetupChecker biometricSetupChecker = BiometricSetupChecker();
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
  String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter String Password';
      } else {
        return null;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthViewModel>(context, listen: false).getCountries();
      Provider.of<AuthViewModel>(context, listen: false).getCurrencies();
      Provider.of<AuthViewModel>(context, listen: false).getLanguages();
      final yourProvider = Provider.of<AuthViewModel>(context, listen: false);
      final bool  =    yourProvider.chkFirstTime ;
     if(bool==true){
       yourProvider.authenticateWithFingerprint(context);
     }


    });
  }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        // viewModel.chkFirstTime == true ? _authenticateWithFingerprint(context,viewModel):Container();
        return Stack(
          children: [
            Scaffold(
                backgroundColor: Color(0xffFFFFFF),
                body: SingleChildScrollView(
                  child: Form(
                    key:  formKey,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: AppColors.primaryColor,
                          child: Column(
                            children: [
                              Gap.verticalSpace(12.h),
                              SvgPicture.asset(
                                AppImages.yafPayLogo,
                                width: 50.w,
                              ),
                              Gap.verticalSpace(13.h),
                              Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.px),
                                    decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            topLeft: Radius.circular(30))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Gap.verticalSpace(2.5.h),
                                        Text(
                                          'Welcome Back',
                                          style: CustomTextStyles.headingStyle(),
                                        ),
                                        Gap.verticalSpace(3.px),
                                        Text(
                                          'Login to continue',
                                          style:
                                              CustomTextStyles.subHeadingStyle(),
                                        ),
                                        Gap.verticalSpace(35.px),
                                        TextFormField(
                                          validator: validateEmail,
                                          keyboardType: TextInputType.emailAddress,
                                          controller: emailController,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(7),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(14),
                                                child: SvgPicture.asset(
                                                    SvgIcons.textFieldLeading),
                                              ),
                                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                              hintText: "example@gmail.com",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: TextFieldColors
                                                          .borDerColor,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: TextFieldColors
                                                          .borDerColor,
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                        ),
                                        Gap.verticalSpace(15.px),
                                        TextFormField(
                                        validator:  validatePassword,
                                          controller: passwordController,
                                          obscureText: obscureText1,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(7),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(14),
                                                child: SvgPicture.asset(
                                                    SvgIcons.lockIcon),
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(obscureText1
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                                onPressed: () {
                                                  obscureText1 = !obscureText1;
                                                  setState(() {});
                                                },
                                              ),
                                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                                              hintText: "●●●●●●●●",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: TextFieldColors
                                                          .borDerColor,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: TextFieldColors
                                                          .borDerColor,
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                        ),
                                        Gap.verticalSpace(5.px),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            child: Text("Forget password ?",
                                                style: CustomTextStyles
                                                    .subHeadingStyle()),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Gap.verticalSpace(8.h),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(100.w, 6.h),
                                                maximumSize: Size(100.w, 6.h),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8)),
                                                backgroundColor:
                                                    AppColors.buttonColor),
                                            onPressed: () async {
                                              // if (emailController.text == "") {
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(SnackBar(
                                              //     content: Text('Enter Email'),
                                              //     duration: Duration(seconds: 2),
                                              //   ));
                                              // } else if (passwordController
                                              //         .text ==
                                              //     "") {
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(SnackBar(
                                              //     content: Text('Enter Password'),
                                              //     duration: Duration(seconds: 2),
                                              //   ));
                                              // } else if (emailController.text !=
                                              //         "" &&
                                              //     passwordController.text != "") {
                                              //
                                              // }
                                                if(formKey.currentState!.validate()){
                                                  viewModel.userLogin(
                                                      emailController.text
                                                          .trim()
                                                          .toLowerCase(),
                                                      passwordController.text
                                                          .trim(),
                                                      context);
                                                }
                                              // final auth = await LocalAuth
                                              //     .authenticate();
                                              // setState(() {
                                              //   authenticated = auth;
                                              // });
                                              // if (auth) {
                                              //   viewModel.userLogin(
                                              //       viewModel.userModel!.email
                                              //           .toString(),
                                              //       viewModel.userModel!.password
                                              //           .toString(), context);
                                              //   // Navigator.push(
                                              //   //     context,
                                              //   //     MaterialPageRoute(
                                              //   //         builder: (_) =>
                                              //   //             NewNav()));
                                              //   // ScaffoldMessenger.of(context)
                                              //   //     .showSnackBar(SnackBar(
                                              //   //   content: Text("User LogedIn"),
                                              //   //   duration: Duration(seconds: 2),
                                              //   // ));
                                              // } else {
                                              //
                                              // }
                                            },
                                            child: Text("Login",
                                                style: CustomTextStyles
                                                    .subHeadingStyle(
                                                        color: AppColors
                                                            .whiteColor))),
                                        viewModel.chkFirstTime == true
                                            ? SizedBox(
                                                height: 15,
                                              )
                                            : Container(),
                                        viewModel.chkFirstTime == true
                                            ? Center(
                                              child: InkWell(
                                                  onTap: () async {
                                                    viewModel.authenticateWithFingerprint(context);

                                                  //
                                                  // final auth = await LocalAuth
                                                  //     .authenticate();
                                                  // setState(() {
                                                  //   authenticated = auth;
                                                  // });
                                                  // if (auth) {
                                                  //   viewModel.userLogin(
                                                  //       viewModel.userModel!.email
                                                  //           .toString(),
                                                  //       viewModel
                                                  //           .userModel!.password
                                                  //           .toString(),
                                                  //       context);
                                                  // } else {
                                                  //   _authenticateWithFingerprint
                                                  // }


                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/dummy/fingerprint.png')),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                  )),
                                            )
                                            : Container(),
                                        Gap.verticalSpace(2.h),

                                        Center(
                                            child: Text("Or",
                                                style: CustomTextStyles
                                                    .subHeadingStyle())),
                                        Gap.verticalSpace(1.h),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        SignUpScreen()));
                                          },
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    "If you don't have an account?",
                                                    style: CustomTextStyles
                                                        .subHeadingStyle()),
                                                Text("  Register",
                                                    style: CustomTextStyles
                                                        .subHeadingStyle(
                                                            color: AppColors
                                                                .greenColor))
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Gap.verticalSpace(5.h)
                                        // AppTextField.simpleField(context,
                                        //     hintText: "example@email.com",
                                        //     controller: emailController),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            if (viewModel.loading) ...[
              Container(
                  height: 100.h,
                  color: Colors.black26,
                  width: 100.w,
                  child: Center(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.px,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.px),
                      color: Colors.black54,
                    ),
                    height: 14.h,
                    width: 22.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        ),
                        SizedBox(
                          height: 10.px,
                        ),
                        Text(
                          'Loading...',
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.px),
                        )
                      ],
                    ),
                  )))
            ]
          ],
        );
      },
    );
  }
  // Future<void> _authenticateWithFingerprint(BuildContext context,AuthViewModel viewModel) async {
  //   final bool isBiometricAvailable = await biometricSetupChecker.isBiometricAvailable();
  //   final bool isBiometricsSetUp = await biometricSetupChecker.isBiometricsSetUp();
  //   // final bool isLockScreenSetUp = await biometricSetupChecker.isLockScreenSetUp();
  //   if (isBiometricAvailable && !isBiometricsSetUp) {
  //     // ignore: use_build_context_synchronously
  //     await biometricSetupChecker.showBiometricNotSetUpDialog(context);
  //   } else if(isBiometricsSetUp){
  //     final auth = await LocalAuth
  //         .authenticate();
  //     setState(() {
  //       authenticated = auth;
  //     });
  //     if (auth) {
  //       viewModel.userLogin(
  //           viewModel.userModel!.email
  //               .toString(),
  //           viewModel
  //               .userModel!.password
  //               .toString(),
  //           context);
  //     } else {
  //
  //     }
  //   }else{
  //     false;
  //   }
  //     // Handle other cases or proceed with biometric authentication
  //   }


}
class BiometricSetupChecker {
  final LocalAuthentication localAuth = LocalAuthentication();
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<bool> isBiometricAvailable() async {
    return await localAuth.canCheckBiometrics;
  }

  Future<bool> isBiometricsSetUp() async {
    final bool isAvailable = await isBiometricAvailable();

    if (isAvailable) {
      final List<BiometricType> availableBiometrics = await localAuth.getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    }

    return false;
  }

  Future<void> showBiometricNotSetUpDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Biometric or Lock Screen Not Set Up',textAlign: TextAlign.center,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.security, size: 50, color: Colors.red),
              SizedBox(height: 16),
              Text('Biometric authentication or lock screen is not set up on your device.'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // openBiometricsSettings(); // Add your logic to navigate to biometrics settings
                },
                child: Text('Set Up Biometrics'),
              ),
            ],
          ),
        );
      },
    );
  }
}
