import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';

class LimitCheck extends StatefulWidget {
  const LimitCheck({super.key});

  @override
  State<LimitCheck> createState() => _LimitCheckState();
}

class _LimitCheckState extends State<LimitCheck> {
  String selectedCountry = 'British Pound';
  String selectedCountry1 = 'Nigerian Naira';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Gap.verticalSpace(4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: AppColors.whiteColor,
                  size: 23,
                )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: 87.h,
        width: double.infinity,
        // color: AppColors.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap.verticalSpace(20.px),
                      Text(
                        'See our rates',
                        style: CustomTextStyles.heading(
                            size: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("Convert your currency here.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff848484))),
                      Gap.verticalSpace(4.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfff2f3f4)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  DropdownButton<String>(
                                    value: selectedCountry,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedCountry = newValue!;
                                      });
                                    },
                                    items: countries.map((Country country) {
                                      return DropdownMenuItem<String>(
                                        value: country.name,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundImage:
                                                  NetworkImage(country.flag),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              country.name,
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: Color(0xff848484),
                                                      size: 12),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text("\$00,00.00",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap.horizontalSpace(1.w),
                          SvgPicture.asset(
                            'assets/Icons/reverse.svg',
                            width: 6.w,
                          ),
                          Gap.horizontalSpace(1.w),
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfff2f3f4)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  DropdownButton<String>(
                                    value: selectedCountry1,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedCountry1 = newValue!;
                                      });
                                    },
                                    items: countries.map((Country country) {
                                      return DropdownMenuItem<String>(
                                        value: country.name,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundImage:
                                                  NetworkImage(country.flag),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              country.name,
                                              style: CustomTextStyles
                                                  .subHeadingStyle(
                                                      color: Color(0xff848484),
                                                      size: 12),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text("\$00,00.00",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Country {
  final String name;
  final String flag;

  Country(this.name, this.flag);
}

List<Country> countries = [
  Country('British Pound',
      'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg'),
  Country('Nigerian Naira',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/1024px-Flag_of_Nigeria.svg.png'),
  // Add more countries with their flags here
];
