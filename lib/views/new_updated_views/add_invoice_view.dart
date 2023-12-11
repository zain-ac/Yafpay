import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';

import '../../helper/gap.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_styles.dart';

class AddInvoiceView extends StatefulWidget {
  const AddInvoiceView({super.key});

  @override
  State<AddInvoiceView> createState() => _AddInvoiceViewState();
}

class _AddInvoiceViewState extends State<AddInvoiceView> {
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
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
                                'Invoice',
                                style: CustomTextStyles.heading(
                                    size: 24, fontWeight: FontWeight.w500),
                              ),
                              Gap.verticalSpace(7.px),
                              const Text("Add Your Invoice Details",
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
                      Row(
                        children: [
                          Expanded(child: customDropDown()),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Add New',
                                style: CustomTextStyles.headingStyle(size: 14),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      customTextField(hintText: 'Customer Email'),
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
                                style: CustomTextStyles.headingStyle(size: 14),
                              ),
                              SizedBox(
                                width: 10.px,
                              ),
                              Icon(moreDetails
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_sharp),
                            ],
                          ),
                        ),
                      ),
                      customTextField(hintText: 'Invoice Title'),
                      SizedBox(
                        height: 15,
                      ),
                      selectCurrency(),
                      SizedBox(
                        height: 15,
                      ),
                      customTextField(hintText: 'Due Date', icon: true),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Item Description',
                        style: CustomTextStyles.headingStyle(size: 14),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      customTextField(hintText: 'Item Description'),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(child: customTextField(hintText: 'Qty')),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(child: customTextField(hintText: 'Price'))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: TextFieldColors.borDerColor),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.px,
                                  ),
                                  Text(
                                    'NGN',
                                    style: CustomTextStyles.subHeadingStyle(
                                        size: 13),
                                  ),
                                  SizedBox(
                                    width: 30.px,
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    hintText: '0.00',
                                    hintStyle: CustomTextStyles.subHeadingStyle(
                                        size: 15),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    // contentPadding: EdgeInsets.all(10),
                                    enabledBorder: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Add new item +',
                            style: CustomTextStyles.headingStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.errorColor,
                                size: 15),
                          )),
                      Divider(
                        color: TextFieldColors.borDerColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Sub Total',
                            style: CustomTextStyles.headingStyle(
                                size: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 23.w,
                          ),
                          Text(
                            '0.00',
                            style: CustomTextStyles.subHeadingStyle(size: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: TextFieldColors.borDerColor),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF9F9F9),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8))),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.px,
                                        ),
                                        Text(
                                          'Discount',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 13),
                                        ),
                                        SizedBox(
                                          width: 10.px,
                                        ),
                                        Icon(Icons.keyboard_arrow_down)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          hintText: '0.00',
                                          hintStyle:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 15),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          // contentPadding: EdgeInsets.all(10),
                                          enabledBorder: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: customTextField(
                              hintText: "₦   0.00",
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: TextFieldColors.borDerColor),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF9F9F9),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8))),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.px,
                                        ),
                                        Text(
                                          'Tax',
                                          style:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 13),
                                        ),
                                        SizedBox(
                                          width: 30.px,
                                        ),
                                        Icon(Icons.keyboard_arrow_down)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          hintText: '0.00',
                                          hintStyle:
                                              CustomTextStyles.subHeadingStyle(
                                                  size: 15),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          // contentPadding: EdgeInsets.all(10),
                                          enabledBorder: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: customTextField(
                              hintText: "₦   0.00",
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Total',
                            style: CustomTextStyles.headingStyle(
                                size: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 23.w,
                          ),
                          Text(
                            '0.00',
                            style: CustomTextStyles.subHeadingStyle(size: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: TextFieldColors.borDerColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      customTextField(hintText: 'Notes'),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Optional',
                        style: CustomTextStyles.headingStyle(
                            size: 12, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     bottom: 4.h
                              // ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100.w, 5.5.h),
                                      maximumSize: Size(100.w, 5.5.h),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColors.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: AppColors.whiteColor),
                                  onPressed: () {},
                                  child: Text("Draft",
                                      style: CustomTextStyles.subHeadingStyle(
                                          color: AppColors.errorColor))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     bottom: 4.h
                              // ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100.w, 5.5.h),
                                      maximumSize: Size(100.w, 5.5.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: AppColors.buttonColor),
                                  onPressed: () {},
                                  child: Text("Create",
                                      style: CustomTextStyles.subHeadingStyle(
                                          color: AppColors.whiteColor))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  )),
            ],
          ),
        ),
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

  Widget selectCurrency() {
    List<String> clients = ['Select Currency', '\$', '£'];

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

  Widget customTextField({
    required String hintText,
    bool icon = false,
  }) {
    return Container(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon:
                icon ? Icon(Icons.calendar_month_sharp) : SizedBox.shrink(),
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
