import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/views/profile/controller/profile_view_controller.dart';

import '../../../../../helper/gap.dart';
import '../../../../../utils/app_colors.dart';

class CreateTags extends StatefulWidget {
  const CreateTags({super.key});

  @override
  State<CreateTags> createState() => _CreateTagsState();
}

class _CreateTagsState extends State<CreateTags> {
  TextEditingController tagController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileViewController>(context, listen: false).getTag();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewController>(
      builder: (context, viewModel, child) {
        if (viewModel.tagResult != null) {
          tagController.text = viewModel.tagResult!.yafpayTag!;
        }
          return Stack(
            children: [
              Scaffold(
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
                            Icons.arrow_back_ios_sharp,
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
                                      ' Create Tags',
                                      style: CustomTextStyles.heading(
                                          size: 24, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Text("Add Details To Create Tags. ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff848484))),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    SizedBox(
                                      height: 50.px,
                                      child: TextFormField(
                                        controller: tagController,
                                        decoration: InputDecoration(
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            suffixIcon: const Padding(
                                              padding: EdgeInsets.all(14),
                                            ),
                                            hintText: "@ Enter User Name For Tag",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color:
                                                    TextFieldColors.borDerColor,
                                                    width: 1),
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color:
                                                    TextFieldColors.borDerColor,
                                                    width: 0.5),
                                                borderRadius:
                                                BorderRadius.circular(8))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.px,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFDF9F3),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Gap.verticalSpace(1.5.h),
                                          Text("Please Note:"),
                                          Text(
                                            "    •   Allowed characters are a-z, 0-9 and underscores(_)\n    •   Minimum character length is 4 characters.",
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff161616),
                                            ),
                                          ),
                                          Gap.verticalSpace(1.5.h),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 4.w,
                      right: 4.w,
                      bottom: 4.h,
                      child: viewModel.tagResult!.yafpayTag == ""
                          ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.w, 6.h),
                              maximumSize: Size(100.w, 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: AppColors.buttonColor),
                          onPressed: () {
                            if (tagController.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Please Enter Tag"),
                                duration: Duration(seconds: 1),
                              ));
                            }else if(tagController.text != ""){
                              viewModel.updateTag(tagController.text.trim(),context);
                            }
                          },
                          child: Text("Create Tag",
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor)))
                          : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.w, 6.h),
                              maximumSize: Size(100.w, 6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: AppColors.buttonColor),
                          onPressed: () {
                            if (tagController.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Please Enter Tag"),
                                duration: Duration(seconds: 1),
                              ));
                            }else if(tagController.text != ""){
                              viewModel.updateTag(tagController.text.trim(),context);
                            }
                          },
                          child: Text("Update",
                              style: CustomTextStyles.subHeadingStyle(
                                  color: AppColors.whiteColor))),
                    )
                  ],
                ),
              ),
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
}
