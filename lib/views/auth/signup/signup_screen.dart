import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:toast/toast.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/views/auth/login/login_screen.dart';
import 'package:sample/views/auth/signup/stepper/controller/stepper_controller.dart';
import 'package:sample/views/auth/signup/stepper/custom_stepper.dart';
import 'package:sample/views/auth/signup/stepper/widgets/fist_step.dart';
import 'package:sample/views/auth/verification/verification_screen.dart';
import 'package:sample/views/bottomnav/new_nav.dart';

import '../../../helper/gap.dart';
import '../../../helper/toastComponent.dart';
import '../../../utils/app_Images.dart';
import '../../../utils/custom_text_styles.dart';
import '../../../view model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController intl_number_controller = TextEditingController();
  bool obscureText1 = true;
  bool obscureText2 = true;
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String initialCountry = 'AE';

  String otpCode = '';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');
  final FocusNode _focusNode = FocusNode();
  String numberOtp = '';
  bool isNumberValid = false;
  bool showSecondSheet = true;
  String userEmail = "";

  OtpFieldController? controller;
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var selectedCountry;
  int intcountry = 0;
  var selectedGender;
  bool sg = false;
  bool sc = false;
  bool sl = false;
  List gennderList = ["MALE", "FEMALE"];

  FocusNode password = FocusNode();
  FocusNode firstName = FocusNode();

  var selectedLanguage;
  int intlanguage = 0;
  final secondStepValidation = GlobalKey<FormState>();
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

  @override
  void initState() {
    super.initState();

    controller = OtpFieldController();
    _focusNode.addListener(() {
      setState(() {});
    });
    // controller!.setFocus(0);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.whiteColor,
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
                                    if (value.currentStep == 0) {
                                      Navigator.pop(context);
                                    } else if (value.currentStep == 1) {
                                      value.previousStep();
                                    } else if (value.currentStep == 2) {
                                      value.previousStep();
                                    } else if (value.currentStep == 3) {
                                      value.previousStep();
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColors.whiteColor,
                                    size: 23,
                                  )),
                            ),
                            Gap.verticalSpace(6.h),
                            SvgPicture.asset(
                              AppImages.yafPayLogo,
                              width: 50.w,
                            ),
                            Gap.verticalSpace(4.h),
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
                                        'Create Account',
                                        style: CustomTextStyles.headingStyle(),
                                      ),
                                      Gap.verticalSpace(3.px),
                                      Text(
                                        'Add your details to register',
                                        style:
                                            CustomTextStyles.subHeadingStyle(),
                                      ),
                                      Gap.verticalSpace(3.h),
                                      CustomStepper(),
                                      Gap.verticalSpace(4.h),
                                      value.currentStep == 0
                                          ? firstStep(value)
                                          : value.currentStep == 1
                                              ? secondStep()
                                              : value.currentStep == 2
                                                  ? thirdStep()
                                                  : fourthStep(
                                                      context, controller!),

                                      value.currentStep == 0
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(100.w, 6.h),
                                                  maximumSize: Size(100.w, 6.h),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  backgroundColor:
                                                      AppColors.buttonColor),
                                              onPressed: () {
                                                if (sc != true) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Please Select Country'),
                                                    duration:
                                                        Duration(seconds: 1),
                                                  ));
                                                } else if (sl != true) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Please Select Language'),
                                                    duration:
                                                        Duration(seconds: 1),
                                                  ));
                                                } else if (sl == true &&
                                                    sc == true &&
                                                    value.currentStep == 0) {
                                                  value.nextStep();
                                                }
                                                // else if (value
                                                //         .currentStep ==
                                                //     1) {
                                                //   if (nameController.text == "") {
                                                //     ScaffoldMessenger.of(context)
                                                //         .showSnackBar(SnackBar(
                                                //       content: Text(
                                                //           'Please Enter First Name'),
                                                //       duration: Duration(seconds: 1),
                                                //     ));
                                                //   } else if (surnameController.text ==
                                                //       "") {
                                                //     ScaffoldMessenger.of(context)
                                                //         .showSnackBar(SnackBar(
                                                //       content: Text(
                                                //           'Please Enter Sur Name'),
                                                //       duration: Duration(seconds: 1),
                                                //     ));
                                                //   } else if (sg != true) {
                                                //     ScaffoldMessenger.of(context)
                                                //         .showSnackBar(SnackBar(
                                                //       content: Text(
                                                //           'Please Select Gender'),
                                                //       duration: Duration(seconds: 1),
                                                //     ));
                                                //   } else if (emailController.text ==
                                                //       "") {
                                                //     ScaffoldMessenger.of(context)
                                                //         .showSnackBar(SnackBar(
                                                //       content:
                                                //           Text('Please Enter Email'),
                                                //       duration: Duration(seconds: 1),
                                                //     ));
                                                //   } else if (intl_number_controller
                                                //           .text ==
                                                //       "") {
                                                //     ScaffoldMessenger.of(context)
                                                //         .showSnackBar(SnackBar(
                                                //       content: Text(
                                                //           'Please Enter Phone Number'),
                                                //       duration: Duration(seconds: 1),
                                                //     ));
                                                //   } else if (value
                                                //               .currentStep ==
                                                //           1 &&
                                                //       nameController.text != "" &&
                                                //       surnameController.text != "" &&
                                                //       sg == true &&
                                                //       intl_number_controller.text !=
                                                //           "" &&
                                                //       emailController.text != "") {
                                                //     value.nextStep();
                                                //   }
                                                else {}

                                                // if (value.currentStep == 3) {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //           builder: (_) =>
                                                //               VerificationScreen()));
                                                // }
                                              },
                                              child: Text("Continue",
                                                  style: CustomTextStyles
                                                      .subHeadingStyle(
                                                          color: AppColors
                                                              .whiteColor)))
                                          : Container(),
                                      value.currentStep == 1
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(100.w, 6.h),
                                                  maximumSize: Size(100.w, 6.h),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  backgroundColor:
                                                      AppColors.buttonColor),
                                              onPressed: () {
                                                if(secondStepValidation.currentState!.validate() && sg == true && isNumberValid == true && value.currentStep == 1 ){
                                                  FocusScope.of(context)
                                                      .requestFocus(password);
                                                  value.nextStep();
                                                }else if(intl_number_controller.text == ""){
                                                  ToastComponent.errorToast('please enter phone number');

                                                } else if (!isNumberValid) {
                                                  ToastComponent.showDialog(
                                                      'Please Enter Valid Number',
                                                      duration: 3,
                                                      gravity: Toast.bottom);
                                                }else if (sg != true){
                                                  ToastComponent.showDialog(
                                                      'Please Select Gender',
                                                      duration: 3,
                                                      gravity: Toast.bottom);
                                                }
                                                // if (nameController.text == "") {
                                                //   ScaffoldMessenger.of(context)
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(
                                                //         'Please Enter First Name'),
                                                //     duration:
                                                //         Duration(seconds: 1),
                                                //   ));
                                                // } else if (surnameController
                                                //         .text ==
                                                //     "") {
                                                //   ScaffoldMessenger.of(context)
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(
                                                //         'Please Enter Sur Name'),
                                                //     duration:
                                                //         Duration(seconds: 1),
                                                //   ));
                                                // } else if (sg != true) {
                                                //   ScaffoldMessenger.of(context)
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(
                                                //         'Please Select Gender'),
                                                //     duration:
                                                //         Duration(seconds: 1),
                                                //   ));
                                                // } else if (emailController
                                                //         .text ==
                                                //     "") {
                                                //   ScaffoldMessenger.of(context)
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(
                                                //         'Please Enter Email'),
                                                //     duration:
                                                //         Duration(seconds: 1),
                                                //   ));
                                                // } else if (intl_number_controller
                                                //         .text ==
                                                //     "") {
                                                //   ScaffoldMessenger.of(context)
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(
                                                //         'Please Enter Phone Number'),
                                                //     duration:
                                                //         Duration(seconds: 1),
                                                //   ));
                                                // } else if (isNumberValid) {
                                                //   if (value.currentStep == 1 &&
                                                //       nameController.text !=
                                                //           "" &&
                                                //       surnameController.text !=
                                                //           "" &&
                                                //       sg == true &&
                                                //       intl_number_controller
                                                //               .text !=
                                                //           "" &&
                                                //       emailController.text !=
                                                //           "") {
                                                //     FocusScope.of(context)
                                                //         .requestFocus(password);
                                                //     value.nextStep();
                                                //   }
                                                // } else if (!isNumberValid) {
                                                //   ToastComponent.showDialog(
                                                //       'Please Enter Valid Number',
                                                //       duration: 3,
                                                //       gravity: Toast.bottom);
                                                // }
                                                // if (value.currentStep == 3) {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //           builder: (_) =>
                                                //               VerificationScreen()));
                                                // }
                                              },
                                              child: Text("Continue",
                                                  style: CustomTextStyles
                                                      .subHeadingStyle(
                                                          color: AppColors
                                                              .whiteColor)))
                                          : Container(),
                                      value.currentStep == 2
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(100.w, 6.h),
                                                  maximumSize: Size(100.w, 6.h),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  backgroundColor:
                                                      AppColors.buttonColor),
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  if (passwordController.text !=
                                                          "" &&
                                                      confirmPasswordController
                                                              .text !=
                                                          "") {
                                                    value.userRegister(
                                                        intcountry,
                                                        intlanguage,
                                                        1,
                                                        nameController.text
                                                            .trim(),
                                                        surnameController.text
                                                            .trim(),
                                                        emailController.text
                                                            .trim(),
                                                        passwordController.text,
                                                        selectedGender,
                                                        intl_number_controller
                                                            .text
                                                            .trim(),
                                                        context);
                                                  }
                                                }

                                                // if (value.currentStep == 3) {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //           builder: (_) =>
                                                //               VerificationScreen()));
                                                // }
                                              },
                                              child: Text("Continue",
                                                  style: CustomTextStyles
                                                      .subHeadingStyle(
                                                          color: AppColors
                                                              .whiteColor)))
                                          : Container(),
                                      value.currentStep == 3
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(100.w, 6.h),
                                                  maximumSize: Size(100.w, 6.h),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  backgroundColor:
                                                      AppColors.buttonColor),
                                              onPressed: () {
                                                value.verifyOtp(
                                                    emailController.text.trim(),
                                                    int.parse(otpCode),
                                                    context);

                                                // if (value.currentStep == 3) {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //           builder: (_) =>
                                                //               VerificationScreen()));
                                                // }
                                              },
                                              child: Text("Continue",
                                                  style: CustomTextStyles
                                                      .subHeadingStyle(
                                                          color: AppColors
                                                              .whiteColor)))
                                          : Container(),

                                      value.currentStep == 0
                                          ? Gap.verticalSpace(2.h)
                                          : SizedBox.shrink(),

                                      value.currentStep == 0
                                          ? Center(
                                              child: Text("Or",
                                                  style: CustomTextStyles
                                                      .subHeadingStyle()))
                                          : SizedBox.shrink(),
                                      value.currentStep == 0
                                          ? Gap.verticalSpace(1.h)
                                          : SizedBox.shrink(),
                                      value.currentStep == 0
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            LoginScreen()));
                                              },
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                        "Do you have any account?",
                                                        style: CustomTextStyles
                                                            .subHeadingStyle()),
                                                    Text("  Login",
                                                        style: CustomTextStyles
                                                            .subHeadingStyle(
                                                                color: AppColors
                                                                    .greenColor))
                                                  ],
                                                ),
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                      Gap.verticalSpace(8.h)

                                      // AppTextField.simpleField(context,
                                      //     hintText: "example@email.com",
                                      //     controller: emailController),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // body: Stack(
                //   children: [
                //     Positioned(
                //       top: 40.h,
                // bottom: 0,
                // top: value.currentStep == 3 ? null : 0,
                // left: 0,
                // right: 0,
                // child:
                // ),
                // ],
                // ),
              ),
              if (value.loading) ...[
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
      ),
    );
  }

  Widget firstStep(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Country',
          style: CustomTextStyles.subHeadingStyle(
              color: AppColors.primaryColor, size: 17),
        ),
        Gap.verticalSpace(1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: TextFieldColors.borDerColor, width: 1),
          ),
          child: DropdownButton(
            isExpanded: true,
            value: selectedCountry,
            icon: Icon(Icons.arrow_drop_down_sharp),
            underline: Container(),
            hint: Text('Select Country'),
            items: viewModel.countries.map((e) {
              return DropdownMenuItem(
                value: e.id,
                child: Text(
                  '${e.name}',
                  style: CustomTextStyles.subHeadingStyle(
                      color: AppColors.primaryColor, size: 17),
                ),
              );
            }).toList(),
            onChanged: (value) {
              selectedCountry = value!;
              intcountry = int.parse(value.toString());
              print('Countrtrtrt : ${intcountry}');
              sc = true;
              print('sdadasdasdada');
              print(selectedCountry);
              setState(() {});
            },
          ),
        ),
        Gap.verticalSpace(2.h),
        Text(
          'Select Your Language',
          style: CustomTextStyles.subHeadingStyle(
              color: AppColors.primaryColor, size: 17),
        ),
        Gap.verticalSpace(1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: TextFieldColors.borDerColor, width: 1),
          ),
          child: DropdownButton(
            isExpanded: true,
            value: selectedLanguage,
            icon: Icon(Icons.arrow_drop_down_sharp),
            underline: Container(),
            hint: Text('Select Language'),
            items: viewModel.languages.map((e) {
              return DropdownMenuItem(
                value: e.id,
                child: Text(
                  '${e.languageName}',
                  style: CustomTextStyles.subHeadingStyle(
                      color: AppColors.primaryColor, size: 17),
                ),
              );
            }).toList(),
            onChanged: (value) {
              sl = true;
              selectedLanguage = value!;
              intlanguage = int.parse(value.toString());
              setState(() {});
            },
          ),
        ),
        Gap.verticalSpace(5.px),
        Gap.verticalSpace(8.h),
      ],
    );
  }

  Widget secondStep() {
    return Form(
      key: secondStepValidation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            focusNode: firstName,
            validator: (value) {
              if(value!.length <=  2){
                return 'Name Should be 3 characters at least';
              }else if(value  == ""){
                return 'Please Enter First Name';
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                hintText: "Enter First Name",
                hintStyle: CustomTextStyles.subHeadingStyle(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: TextFieldColors.borDerColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: TextFieldColors.borDerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8))),
          ),
          Gap.verticalSpace(1.5.h),
          TextFormField(
            validator: (value) {
              if(value!.length <= 2){
                return 'Surname Should be 3 characters at least';
              }else if(value  == ""){
                return 'Please Enter Surname';
              }else{
                return null;
              }
            },
            controller: surnameController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                hintText: "Enter surname",
                hintStyle: CustomTextStyles.subHeadingStyle(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: TextFieldColors.borDerColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: TextFieldColors.borDerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8))),
          ),
          Gap.verticalSpace(1.5.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: TextFieldColors.borDerColor, width: 1),
            ),
            child: DropdownButton(
              isExpanded: true,
              value: selectedGender,
              icon: Icon(Icons.arrow_drop_down_sharp),
              underline: Container(),
              hint: Text('Select Gender'),
              items: gennderList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    '$e',
                    style: CustomTextStyles.subHeadingStyle(
                        color: AppColors.primaryColor, size: 17),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                selectedGender = value;
                sg = true;
                setState(() {});
              },
            ),
          ),
          Gap.verticalSpace(1.5.h),
          TextFormField(
            validator: validateEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            controller: emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                hintText: "Enter Email",
                hintStyle: CustomTextStyles.subHeadingStyle(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: TextFieldColors.borDerColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: TextFieldColors.borDerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8))),
          ),
          Gap.verticalSpace(1.5.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: TextFieldColors.borDerColor, width: 1),
                borderRadius: BorderRadius.circular(8)),
            width: 100.w,
            child: InternationalPhoneNumberInput(
              focusNode: _focusNode,
              hintText: 'xxxxxxxx',
              onInputChanged: (PhoneNumber number) {
                // setState(() {});
                // if (intl_number_controller
                //     .text.isEmpty) {
                //   showIcon = false;
                //   setState(() {});
                // } else {
                //   showIcon = true;
                //   setState(() {});
                // }
                //
                // numberOtp = number.phoneNumber!;
              },
              onInputValidated: (bool value) {
                isNumberValid = value;
                print("Invalid$value");
              },
              onSubmit: () {
                // _focusNode.unfocus();
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              maxLength: 15,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: intl_number_controller,
              formatInput: false,
              keyboardType: TextInputType.number,
              inputBorder: InputBorder.none,
              onSaved: (PhoneNumber number) {},
            ),
          ),
          Gap.verticalSpace(1.5.h),
          Container(
            height: 50.px,
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                  hintText: "Enter Referral Code",
                  hintStyle: CustomTextStyles.subHeadingStyle(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: TextFieldColors.borDerColor, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: TextFieldColors.borDerColor, width: 0.5),
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Gap.verticalSpace(.3.h),
          Text(
            'Optional',
            style: CustomTextStyles.subHeadingStyle(
                size: 12, color: AppColors.primaryColor),
          ),
          Gap.verticalSpace(4.h),
        ],
      ),
    );
  }

  Widget thirdStep() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: TextFormField(
              focusNode: password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                } else if (!_containsSpecialCharacter(value!)) {
                  return 'Password must contain at least one special character';
                }
                return null;
              },
              controller: passwordController,
              obscureText: obscureText1,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText1 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      obscureText1 = !obscureText1;
                      setState(() {});
                    },
                  ),
                  // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                  hintText: "Enter Password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: TextFieldColors.borDerColor, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: TextFieldColors.borDerColor, width: 0.5),
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Gap.verticalSpace(2.h),
          Container(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                } else if (!_containsSpecialCharacter(value!)) {
                  return 'Password must contain at least one special character';
                } else if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              controller: confirmPasswordController,
              obscureText: obscureText2,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText2 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      obscureText2 = !obscureText2;
                      setState(() {});
                    },
                  ),
                  // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                  hintText: "Enter Confirm Password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: TextFieldColors.borDerColor, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: TextFieldColors.borDerColor, width: 0.5),
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Gap.verticalSpace(30.h),
        ],
      ),
    );
  }

  Widget fourthStep(BuildContext context, OtpFieldController controller) {
    // controller.set(['0,0,0,0,0']);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify Your Email',
          style: CustomTextStyles.subHeadingStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              size: 17),
        ),
        Gap.verticalSpace(9.h),
        OTPTextField(
          controller: controller,
          length: 5,
          width: 100.w,
          fieldWidth: 10.w,
          onChanged: (value) {},
          style: TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            otpCode = pin;
            print("Completed: " + pin);
          },
        ),
        Gap.verticalSpace(9.h),
      ],
    );
  }

  bool _containsSpecialCharacter(String value) {
    // Define your list of special characters
    List<String> specialCharacters = ['!', '@', '#', '\$', '%', '^', '&', '*'];

    // Check if the value contains any special character
    return specialCharacters.any((char) => value.contains(char));
  }
}
