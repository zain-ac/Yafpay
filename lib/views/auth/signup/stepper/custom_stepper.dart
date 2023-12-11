import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:svg_flutter/svg.dart';
import 'package:sample/helper/gap.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/utils/custom_text_styles.dart';
import 'package:sample/view%20model/auth_view_model.dart';
import 'package:sample/views/auth/signup/stepper/controller/stepper_controller.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> active = [
      'assets/Icons/globe_active_icon.svg',
      'assets/Icons/active_person.svg',
      'assets/Icons/active_lock.svg',
      'assets/Icons/active_mail.svg'
    ];
    List<String> unActive = [
      'assets/Icons/unActive_person.svg',
      'assets/Icons/unActive_person.svg',
      'assets/Icons/unActive_lock.svg',
      'assets/Icons/unActive_mail.svg'
    ];
    List<String> complete = [
      'assets/Icons/complete.svg',
      'assets/Icons/complete.svg',
      'assets/Icons/complete.svg',
      'assets/Icons/complete.svg',
    ];

    List<String> activeStepper = [
      'assets/Icons/active_stepper.svg',
      'assets/Icons/active_stepper.svg',
      'assets/Icons/active_stepper.svg',
      'assets/Icons/active_stepper.svg',
    ];

    List<String> unActiveStepper = [
      'assets/Icons/unactive_stepper.svg',
      'assets/Icons/unactive_stepper.svg',
      'assets/Icons/unactive_stepper.svg',
      'assets/Icons/unactive_stepper.svg',
    ];

    List<String> completeStepper = [
      'assets/Icons/complete_stepper.svg',
      'assets/Icons/complete_stepper.svg',
      'assets/Icons/complete_stepper.svg',
      'assets/Icons/complete_stepper.svg',
    ];

    List<String> text = [
      'Country',
      'Account Setup',
      'Password',
      'Email Verify'
    ];
    return Consumer<AuthViewModel>(
      builder: (context, value, child) {
        return Container(
          height: 11.h,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isActive = value.currentStep == index;
              final isCompleted = value.currentStep > index;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              child: isActive
                                  ? SvgPicture.asset(active[index])
                                  : isCompleted
                                      ? SvgPicture.asset(complete[index])
                                      : SvgPicture.asset(
                                          unActive[index],
                                        )),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              width: 11.w,
                              child: index == 3
                                  ? SizedBox.shrink()
                                  : isActive
                                      ? SvgPicture.asset(activeStepper[index])
                                      : isCompleted
                                          ? SvgPicture.asset(
                                              completeStepper[index])
                                          : SvgPicture.asset(
                                              unActiveStepper[index])),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                      Gap.verticalSpace(.5.h),
                      Text(
                        'Step ${index + 1}',
                        style: CustomTextStyles.subHeadingStyle(size: 12),
                      ),
                      Gap.verticalSpace(.2.h),
                      Text(
                        text[index],
                        style: CustomTextStyles.subHeadingStyle(
                            size: 11,
                            color: isActive
                                ? AppColors.primaryColor
                                : isCompleted
                                    ? AppColors.greenColor
                                    : AppColors.greyTextColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              );
            },
            itemCount: 4,
          ),
        );
      },
    );
  }

}
