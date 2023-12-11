import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  bool moreDetails = false;

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
            height: 88.h,
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Customer',
                                    style: CustomTextStyles.heading(
                                        size: 24, fontWeight: FontWeight.w500),
                                  ),
                                  Gap.verticalSpace(7.px),
                                  const Text("Add your customer details.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff848484))),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.5.h,
                          ),
                          !moreDetails
                              ? customTextField(hintText: "Customer'Name")
                              : Container(),
                          moreDetails
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(),
                          moreDetails
                              ? Row(
                                  children: [
                                    Expanded(child: customDropDown()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Add New',
                                          style: CustomTextStyles.headingStyle(
                                              size: 14),
                                        ))
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: 15,
                          ),
                          customTextField(hintText: 'Customer Email'),
                          !moreDetails
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(),
                          !moreDetails
                              ? customTextField(hintText: 'Phone Number')
                              : Container(),
                          InkWell(
                            onTap: () {
                              moreDetails = !moreDetails;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'More Details',
                                    style:
                                        CustomTextStyles.headingStyle(size: 14),
                                  ),
                                  SizedBox(
                                    width: 10.px,
                                  ),
                                  Icon(moreDetails
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_sharp)
                                ],
                              ),
                            ),
                          ),
                          moreDetails
                              ? customTextField(hintText: 'Billing address')
                              : Container(),
                          moreDetails
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(),
                          moreDetails ? customCountryDropDow() : Container(),
                          moreDetails
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(),
                          moreDetails ? customStateDropDown() : Container(),
                          moreDetails
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(),
                          moreDetails
                              ? customTextField(hintText: 'Enter City')
                              : Container(),
                          moreDetails
                              ? SizedBox(
                                  height: 15,
                                )
                              : Container(),
                          moreDetails
                              ? customTextField(hintText: 'Enter Zip Code')
                              : Container()
                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 2.h,
            left: 2.w,
            right: 2.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              // margin: EdgeInsets.only(
              //     bottom: 4.h
              // ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 6.h),
                      maximumSize: Size(100.w, 6.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: AppColors.buttonColor),
                  onPressed: () {},
                  child: Text("Save",
                      style: CustomTextStyles.subHeadingStyle(
                          color: AppColors.whiteColor))),
            ),
          ),
        ],
      ),
    );
  }

  Widget customDropDown() {
    List<String> clients = ['Select Client', 'Client B', 'Client C'];

    // Selected value from the dropdown
    String selectedClient = 'Select Client';
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

  Widget customStateDropDown() {
    List<String> clients = ['Select State', 'Alaska', 'California', 'Texas'];

    // Selected value from the dropdown
    String selectedClient = 'Select State';
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

  Widget customTextField({required String hintText}) {
    return Container(
      height: 60,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: CustomTextStyles.subHeadingStyle(size: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffDCDCDC))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primaryColor)),
            // contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffDCDCDC)))),
      ),
    );
  }
}
