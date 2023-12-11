import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../helper/gap.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_text_styles.dart';
import '../../home/components/add_money/add_money.dart';

class AddBenifeiry extends StatefulWidget {
  const AddBenifeiry({super.key});

  @override
  State<AddBenifeiry> createState() => _AddBenifeiryState();
}

class _AddBenifeiryState extends State<AddBenifeiry> {
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
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                  size: 23,
                )),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            'Add New Beneficiary',
                            style: CustomTextStyles.heading(
                                size: 24, fontWeight: FontWeight.w500),
                          ),
                          Gap.verticalSpace(7.px),
                          const Text("Add Details To Add New Recipient",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff848484))),
                          Gap.verticalSpace(25.px),
                          customCurrency(),
                          Gap.verticalSpace(15.px),
                          customCountryDropDow(),
                          Gap.verticalSpace(15.px),
                          customType(),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Enter First Name",
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Enter Last Name",
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Enter Bank Account Number",
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Enter Bank Sort Code",
                          ),
                          Gap.verticalSpace(15.px),
                          ContainerTextField(
                            t1: "Enter Bank Swift Code",
                          ),
                          SizedBox(
                            height: 6.h,
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
                              child: Text("Create Beneficiary",
                                  style: CustomTextStyles.subHeadingStyle(
                                      color: AppColors.whiteColor))),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget customCountryDropDow() {
    List<String> clients = [
      'Select Country',
      'United Arab Emirates',
      'United States'
    ];

    // Selected value from the dropdown
    String selectedClient = 'Select Country';
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)),
      child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 20),
        underline: Container(),
        isExpanded: true,
        value: selectedClient,
        items: clients.map((String client) {
          return DropdownMenuItem<String>(
            value: client,
            child: Text(
              client,
              style: CustomTextStyles.subHeadingStyle(size: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedClient = newValue!;
          });
        },
      ),
    );
  }
  Widget customType() {
    List<String> clients = [
      'Recipient Type',
      'Type 1 ',
      'Type 2 '
    ];

    // Selected value from the dropdown
    String selectedClient = 'Recipient Type';
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)),
      child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 20),
        underline: Container(),
        isExpanded: true,
        value: selectedClient,
        items: clients.map((String client) {
          return DropdownMenuItem<String>(
            value: client,
            child: Text(
              client,
              style: CustomTextStyles.subHeadingStyle(size: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedClient = newValue!;
          });
        },
      ),
    );
  }
  Widget customCurrency() {
    List<String> clients = [
      'Select Currency',
      '£',
      '\$',

    ];

    // Selected value from the dropdown
    String selectedClient = 'Select Currency';
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)),
      child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 20),
        underline: Container(),
        isExpanded: true,
        value: selectedClient,
        items: clients.map((String client) {
          return DropdownMenuItem<String>(
            value: client,
            child: Text(
              client,
              style: CustomTextStyles.subHeadingStyle(size: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedClient = newValue!;
          });
        },
      ),
    );
  }
}
