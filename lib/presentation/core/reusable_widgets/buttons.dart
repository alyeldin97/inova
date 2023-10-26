import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Inova/presentation/core/reusable_widgets/padding.dart';
import 'package:Inova/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:Inova/presentation/utils/colors.dart';
import 'package:Inova/presentation/utils/textstyles.dart';

class AppButton extends StatelessWidget {
  final bool isFilled;
  final double width;
  final double height;
  final double? borderThickness;
  final bool hasShadow;
  final double textSize;
  final Color? color;
  final Color secondaryColor;
  Color? borderColor;
  Color textColor;
  final String text;
  final Function()? onPressed;

  AppButton(
      {super.key,
      this.isFilled = true,
      this.width = double.infinity,
      required this.color,
      required this.text,
      this.onPressed,
      this.hasShadow = false,
      this.borderColor,
      this.borderThickness = 5,
      this.textColor = AppColors.white,
      this.secondaryColor = AppColors.backGroundColor,
      this.height = 53.0,
      this.textSize = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 3.w,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
            border: borderColor == null
                ? null
                : Border.all(color: borderColor!, width: borderThickness!.w),
          ),
          child: Center(
            child: PrimaryTextSemiBold(
              text: text,
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
