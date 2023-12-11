import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sample/utils/app_colors.dart';

class AppTextField extends TextFormField {
  AppTextField({super.key});

  // FocusNode _focus = FocusNode();
  static simpleField(BuildContext context,
      {required String hintText,
      required TextEditingController controller,
      bool readOnly = false,
      int? maxLength,
      int? maxLines,
      Function? onTap,
      bool isprefix = false,
      bool issuffix = false,
      IconData? prefixicon,
      IconData? suffixicon,
      VoidCallback? issuffixtapped}) {
    return Container(
      height: 10.h,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        readOnly: readOnly,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please $hintText";
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          prefixIcon: isprefix
              ? Icon(
                  prefixicon,
                  // color: Colors.black38,
                  size: 6.h,
                )
              : null,
          suffixIcon: issuffix
              ? IconButton(
                  onPressed: issuffixtapped,
                  splashRadius: 25,
                  icon: Icon(
                    suffixicon,
                    // color: Colors.black38,
                    size: 6.h,
                  ))
              : null,
          helperText: "",
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.greyTextColor,
              width: 1.5,
            ),
          ),
          errorStyle: TextStyle(
            color: AppColors.errorColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        maxLength: maxLength,
        maxLines: maxLines,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        onTap: () {
          onTap!();
        },
      ),
    );
  }
}
