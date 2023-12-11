import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sample/views/new_updated_views/chnage_pin.dart';
import 'package:sample/views/new_updated_views/two_factor_auth_pin.dart';
import 'package:sample/views/new_updated_views/twofactorscreen.dart';
import 'package:sample/views/profile/controller/profile_view_controller.dart';
import 'package:sample/views/security/components/changepassword.dart';
import 'package:sample/views/security/components/limit_check.dart';
import 'package:sample/views/security/components/login_activity.dart';
import 'package:sample/views/security/components/next_to_kin.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';
import '../auth/verification/add_kyc_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  bool isChecked = false;
  bool isChecked1 = false;

  bool switchVal = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  void toggleCheckbox(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  void toggleCheckbox1(bool value) {
    setState(() {
      isChecked1 = value;
    });
  }

  void toggleCheckbox2(bool value) {
    setState(() {
      isChecked2 = value;
    });
  }

  void toggleCheckbox3(bool value) {
    setState(() {
      isChecked3 = value;
    });
  }

  void toggleCheckbox4(bool value) {
    setState(() {
      isChecked4 = value;
    });
  }
@override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileViewController>(context, listen: false).getProfileData();


    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewController>(
      builder: (context, viewModel, child) {
        if(viewModel.profileResult != null){
          nameController.text = viewModel.profileResult!.user!.firstName! + viewModel.profileResult!.user!.lastName!;
          tagController.text = viewModel.profileResult!.user!.yafpayTag.toString();
          emailController.text = viewModel.profileResult!.user!.email.toString() ;
          phoneController.text = viewModel.profileResult!.user!.phoneNumber.toString() ;
        }
        return Scaffold(
            backgroundColor: AppColors.primaryColor,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: 87.h,
              width: double.infinity,
              // color: AppColors.primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap.verticalSpace(20.px),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Profile',
                                      style: CustomTextStyles.headingStyle(),
                                    ),
                                    Text(
                                      'Following is your overall profile information.',
                                      style: CustomTextStyles.subHeadingStyle(
                                          size: 14),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Gap.verticalSpace(30.px),
                            SizedBox(
                                height: 30.px,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.basicActive();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  viewModel.basicInfo ? 0 : 0),
                                          height: 30.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  viewModel.basicInfo ? 20 : 10,
                                              vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: viewModel.basicInfo
                                                  ? const Color(0xffFEEDED)
                                                  : Colors.transparent),
                                          child: Text('Basic Info',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: viewModel.basicInfo
                                                          ? AppColors.errorColor
                                                          : const Color(
                                                              0xff444444),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.notificationActive();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 0),
                                          height: 30.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: viewModel.notification
                                                  ? 20
                                                  : 10,
                                              vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: viewModel.notification
                                                  ? const Color(0xffFEEDED)
                                                  : Colors.transparent),
                                          child: Text('Notification',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: viewModel
                                                              .notification
                                                          ? AppColors.errorColor
                                                          : const Color(
                                                              0xff444444),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.securityActive();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 0),
                                          height: 30.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  viewModel.security ? 20 : 10,
                                              vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: viewModel.security
                                                  ? const Color(0xffFEEDED)
                                                  : Colors.transparent),
                                          child: Text('Security',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: viewModel.security
                                                          ? AppColors.errorColor
                                                          : const Color(
                                                              0xff444444),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.limitsActive();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 0),
                                          height: 30.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  viewModel.limits ? 20 : 10,
                                              vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: viewModel.limits
                                                  ? const Color(0xffFEEDED)
                                                  : Colors.transparent),
                                          child: Text('Limits',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: viewModel.limits
                                                          ? AppColors.errorColor
                                                          : const Color(
                                                              0xff444444),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.othersActive();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 0),
                                          height: 30.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  viewModel.others ? 20 : 10,
                                              vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: viewModel.others
                                                  ? const Color(0xffFEEDED)
                                                  : Colors.transparent),
                                          child: Text('Others',
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: viewModel.others
                                                          ? AppColors.errorColor
                                                          : const Color(
                                                              0xff444444),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 12)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            viewModel.basicInfo
                                ? buildBasicInfoView(viewModel)
                                : Container(),
                            viewModel.notification
                                ? buildNotificationView()
                                : Container(),
                            viewModel.security
                                ? buildSecurityView()
                                : Container(),
                            viewModel.limits ? buildLimitView() : Container(),
                            viewModel.others ? buildOtherView() : Container(),
                            Gap.verticalSpace(8.h),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(100.w, 6.h),
                                    maximumSize: Size(100.w, 6.h),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: AppColors.buttonColor),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // value.nextStep();
                                  // if(value.currentStep == 3){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (_)=>VerificationScreen()));
                                  // }
                                },
                                child: Text("Save Changes",
                                    style: CustomTextStyles.subHeadingStyle(
                                        color: AppColors.whiteColor))),
                            Gap.verticalSpace(3.h),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            // backgroundColor: Colors.white,
            body: Column(
              children: [
                Gap.verticalSpace(4.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: AppColors.whiteColor,
                        size: 23,
                      )),
                ),
              ],
            ));
      },
    );
  }

  buildBasicInfoView(ProfileViewController viewController) {
    return Column(
      children: [
        Gap.verticalSpace(4.h),
        SizedBox(
          height: 60.px,
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                hintText: "Full Name",

                hintStyle: CustomTextStyles.subHeadingStyle(),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: TextFieldColors.borDerColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: TextFieldColors.borDerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8))),
          ),
        ),
        Gap.verticalSpace(15.px),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 60.px,
                child: TextFormField(
                  controller: tagController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                      hintText: "@ YAFPAY tag",
                      hintStyle: CustomTextStyles.subHeadingStyle(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: TextFieldColors.borDerColor, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: TextFieldColors.borDerColor, width: 0.5),
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
            ),
            Gap.horizontalSpace(15.px),
            TextButton(
                onPressed: () {
                  if (tagController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please Enter Tag"),
                      duration: Duration(seconds: 1),
                    ));
                  }else if(tagController.text != ""){
                    viewController.updateTag(tagController.text.trim(),context);
                  }
                },
                child: Text(
                  "Update",
                  style: CustomTextStyles.subHeadingStyle(
                      color: AppColors.errorColor),
                ))
          ],
        ),
        Gap.verticalSpace(15.px),
        SizedBox(
          height: 60.px,
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                hintText: "Email Address",
                hintStyle: CustomTextStyles.subHeadingStyle(),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: TextFieldColors.borDerColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: TextFieldColors.borDerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8))),
          ),
        ),
        Gap.verticalSpace(15.px),
        SizedBox(
          height: 60.px,
          child: TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                hintText: "Phone Number",
                hintStyle: CustomTextStyles.subHeadingStyle(),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: TextFieldColors.borDerColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: TextFieldColors.borDerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ],
    );
  }

  buildNotificationView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.verticalSpace(4.h),
        const Text("Login Alerts",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 4.px,
        ),
        const Text("Notifications on successful logins to your account",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 20.px,
        ),
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              activeColor: Colors.green,
              // Change the color of the checked circle
              checkColor: Colors.white,
              // Change the color of the checkmark
              value: isChecked,
              onChanged: (value) {
                toggleCheckbox(value!);
              },
            ),
            const Text("Push Notification",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              width: 10.w,
            ),
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              activeColor: Colors.green,
              // Change the color of the checked circle
              checkColor: Colors.white,
              // Change the color of the checkmark
              value: isChecked1,
              onChanged: (value) {
                toggleCheckbox1(value!);
              },
            ),
            const Text("Email",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: 350,
          color: const Color(0xffE6E6E6),
          height: 1,
        ),
        Gap.verticalSpace(2.h),
        const Text("Transaction Alert",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 4.px,
        ),
        const Text("Notifications on the status of your transactions.",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 20.px,
        ),
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              activeColor: Colors.green,
              // Change the color of the checked circle
              checkColor: Colors.white,
              // Change the color of the checkmark
              value: isChecked3,
              onChanged: (value) {
                toggleCheckbox3(value!);
              },
            ),
            const Text("Push Notification",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              width: 10.w,
            ),
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              activeColor: Colors.green,
              // Change the color of the checked circle
              checkColor: Colors.white,
              // Change the color of the checkmark
              value: isChecked2,
              onChanged: (value) {
                toggleCheckbox2(value!);
              },
            ),
            const Text("Email",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: 350,
          color: const Color(0xffE6E6E6),
          height: 1,
        ),
        Gap.verticalSpace(2.h),
        const Text("Price Alert",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 4.px,
        ),
        const Text("Notifications on fluctuations in currency rates",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 20.px,
        ),
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              activeColor: Colors.green,
              // Change the color of the checked circle
              checkColor: Colors.white,
              // Change the color of the checkmark
              value: isChecked4,
              onChanged: (value) {
                toggleCheckbox4(value!);
              },
            ),
            const Text("Push Notification",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xff656565),
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  buildSecurityView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.verticalSpace(4.h),
          Row(
            children: [
              const Text("Two Factor authentication",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  )),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const TwoFactorScreens()));
                  },
                  child: const Text("Set up",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.w500,
                      ))),

            ],
          ),
          SizedBox(
            height: 1.px,
          ),
          const Text(
              "Add an extra layer of security to your account to\nprotect you from unauthorized transactions.",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xfF848484),
                fontWeight: FontWeight.w400,
              )),
          SizedBox(
            height: 30.px,
          ),
          const Text("Password",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(
            height: 1.px,
          ),
          Row(
            children: [
              const Text("Update existing password",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xfF848484),
                    fontWeight: FontWeight.w400,
                  )),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ChangePassword()));
                  },
                  child: const Text("Change",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.w500,
                      ))),
            ],
          ),
          SizedBox(
            height: 30.px,
          ),
          const Text("Devices & sessions",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(
            height: 0.px,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("See the devices you are currently logged\ninto",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xfF848484),
                    fontWeight: FontWeight.w400,
                  )),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LoginActivity()));
                  },
                  child: const Text("Login Activity",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.w500,
                      ))),
            ],
          ),
          SizedBox(
            height: 30.px,
          ),
          const Text("Next to kin",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(
            height: 0.px,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 70.w,
                child: const Text(
                    "Authorize who can have designated access to\nyour account during certain emergencies.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xfF848484),
                      fontWeight: FontWeight.w400,
                    )),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const NextToKin()));
                  },
                  child: const Text("Set up",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.w500,
                      ))),
            ],
          ),
          SizedBox(
            height: 30.px,
          ),
          const Text("Change PIN",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(
            height: 0.px,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 70.w,
                child: const Text("Update existing PIN for security",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xfF848484),
                      fontWeight: FontWeight.w400,
                    )),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ChangePin()));
                  },
                  child: const Text("Change",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.w500,
                      ))),
            ],
          ),
        ],
      ),
    );
  }

  buildLimitView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.verticalSpace(4.h),
        const Text("Withdraw limits",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 20.px,
        ),
        const Row(
          children: [
            Text("Daily Limit: \$5,000.00",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            Spacer(),
            Text("Refreshed 6h",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff36BC6C),
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(
          height: 12.px,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(21),

          // height: 30.0, // Set the desired height
          child: const LinearProgressIndicator(
            value: 0.0,
            minHeight: 20,
            // Set the progress value (0.0 to 1.0)
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            // Fill color
            backgroundColor: Color(0xffECECEC), // Background color
          ),
        ),
        SizedBox(
          height: 2.px,
        ),
        const Text("Used \$0",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 20.px,
        ),
        const Row(
          children: [
            Text("Monthly Limit: \$5,000.00",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            Spacer(),
            Text("Refreshed 1 November",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff36BC6C),
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(
          height: 12.px,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(21),

          // height: 30.0, // Set the desired height
          child: const LinearProgressIndicator(
            value: 0.0,
            minHeight: 20,
            // Set the progress value (0.0 to 1.0)
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            // Fill color
            backgroundColor: Color(0xffECECEC), // Background color
          ),
        ),
        SizedBox(
          height: 2.px,
        ),
        const Text("Used \$0",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 30.px,
        ),
        Container(
          width: 350,
          color: const Color(0xffE6E6E6),
          height: 0.8,
        ),
        SizedBox(
          height: 30.px,
        ),
        const Text("Deposit limits",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 20.px,
        ),
        const Text("Bank Account Deposit",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        const Text("Note: There are no limits for foreign account deposits.",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffB3B3B3),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 20.px,
        ),
        const Row(
          children: [
            Text("Daily Limit: \$5,000.00",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            Spacer(),
            Text("Refreshed 6h",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff36BC6C),
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(
          height: 12.px,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(21),

          // height: 30.0, // Set the desired height
          child: const LinearProgressIndicator(
            value: 0.0,
            minHeight: 20,
            // Set the progress value (0.0 to 1.0)
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            // Fill color
            backgroundColor: Color(0xffECECEC), // Background color
          ),
        ),
        SizedBox(
          height: 2.px,
        ),
        const Text("Used \$0",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 20.px,
        ),
        const Row(
          children: [
            Text("Monthly Limit: \$5,000.00",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            Spacer(),
            Text("Refreshed 1 November",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff36BC6C),
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(
          height: 12.px,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(21),

          // height: 30.0, // Set the desired height
          child: const LinearProgressIndicator(
            value: 0.0,
            minHeight: 20,
            // Set the progress value (0.0 to 1.0)
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            // Fill color
            backgroundColor: Color(0xffECECEC), // Background color
          ),
        ),
        SizedBox(
          height: 2.px,
        ),
        const Text("Used \$0",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }

  buildOtherView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.verticalSpace(4.h),
        const Text("App language",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 20.px,
        ),
        Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white),
          child: Row(
            children: [
              SizedBox(
                width: 15.px,
              ),
              const Text("English",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff656565),
                    fontWeight: FontWeight.w400,
                  )),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
                color: TextFieldColors.borDerColor,
              ),
              SizedBox(
                width: 15.px,
              ),
            ],
          ),
        ),
        Gap.verticalSpace(2.h),
        const Text("Talk to support",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        Gap.verticalSpace(.5.h),
        const Text("Talk to our customer support",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff848484),
              fontWeight: FontWeight.w400,
            )),
        SizedBox(
          height: 30.px,
        ),
        const Text("See our rates",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            )),
        Gap.verticalSpace(.5.h),
        Row(
          children: [
            const Text("Convert your currency here.",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff848484),
                  fontWeight: FontWeight.w400,
                )),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LimitCheck()));
                },
                child: Text(
                  'Check',
                  style: CustomTextStyles.subHeadingStyle(
                      color: AppColors.errorColor, size: 15),
                ))
          ],
        ),
      ],
    );
  }
}
