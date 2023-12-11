import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../helper/gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_styles.dart';

class NextToKin extends StatefulWidget {
  const NextToKin({super.key});

  @override
  State<NextToKin> createState() => _NextToKinState();
}

class _NextToKinState extends State<NextToKin> {
  String selectedCountry = '+44';

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
                        'Next to kin',
                        style: CustomTextStyles.heading(
                            size: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("Add detail to create your kin.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff848484))),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter kin’s first name",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Container(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter kin’s last name",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Container(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter kin’s email",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Container(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter kin’s house address",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Container(
                        height: 50.px,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),

                              // prefixIcon: SvgPicture.asset(SvgIcons.textFieldLeading,),
                              hintText: "Enter kin’s house address",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: TextFieldColors.borDerColor,
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              color: Colors.grey.shade200,
                              width: 25.w,
                              child: Center(
                                child: DropdownButton<String>(
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
                                          Image.network(
                                            country.flag,
                                            width: 24,
                                            // Adjust the image size as needed
                                            height: 16,
                                          ),
                                          SizedBox(width: 8),
                                          Text(country.name),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  underline: Container(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                  hintText: '0 000 000 00',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10.px),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Relationship with kin",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff656565),
                                  fontWeight: FontWeight.w400,
                                )),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.w, 6.h),
                              maximumSize: Size(100.w, 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: AppColors.buttonColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Submit",
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor))),
                      Gap.verticalSpace(2.h),
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
  Country('+44',
      'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg'),
  Country('+99',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/1024px-Flag_of_Nigeria.svg.png'),
  // Add more countries with their flags here
];
