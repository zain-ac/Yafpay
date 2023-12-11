import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';

import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';

import '../../../../utils/app_Images.dart';

class CreateReferalls extends StatefulWidget {
  const CreateReferalls({super.key});

  @override
  State<CreateReferalls> createState() => _CreateReferallsState();
}

class _CreateReferallsState extends State<CreateReferalls> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.primaryColor,
                  child: Column(
                    children: [
                      Gap.verticalSpace(25.px),
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
                      SvgPicture.asset('assets/Icons/reffrels.svg'),
                      Gap.verticalSpace(15.px),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.px, vertical: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Referals',
                                        style: CustomTextStyles.headingStyle(),
                                      ),
                                      SvgPicture.asset(
                                          'assets/Icons/filter.svg'),
                                    ],
                                  ),
                                  Gap.verticalSpace(5.px),
                                  const Text(
                                    "There are you overall beneficiary.",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff848484),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Gap.verticalSpace(19.px),
                                  ListTile(
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xfff6f5f5)),
                                      child: const Center(
                                          child: Icon(Icons.person_4_outlined)),
                                    ),
                                    title: Text(
                                      'Codellia Iltem',
                                      style: CustomTextStyles.subHeadingStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                    subtitle: Text(
                                      'Sep, 30, 2023',
                                      style: CustomTextStyles.subHeadingStyle(
                                          size: 10),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "\$56",
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff142445),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '12:00',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 10,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,

                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 27.h,
                      padding: EdgeInsets.only(
                        left: 12.px,right: 12.px
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                              "Add my referrals",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                          SizedBox(
                            height: 20,
                          ),

                      Container(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(7),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter Referral email ",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius:
                                  BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius:
                                  BorderRadius.circular(8))),
                        ),
                      ),

                          SizedBox(height: 30),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100.w, 6.h),
                                  maximumSize: Size(100.w, 6.h),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8)),
                                  backgroundColor:
                                  AppColors.buttonColor),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //         const CreateReferalls()));
                              },
                              child: Text("Send Email",
                                  style: CustomTextStyles
                                      .subHeadingStyle(
                                      color:
                                      AppColors.whiteColor))),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),

                  );
                },
              );
            },
            backgroundColor: Colors.redAccent,
            child: const Icon(
              Icons.add,
              size: 37,
            ),
          ),
        );
      },
    );
  }
}
