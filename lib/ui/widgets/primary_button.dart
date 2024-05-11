import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RoundedElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? buttonColor;
  final Color? borderColor;
  final double borderWidth;
  final double textFontSize;
  final Color textColor;
  final FontWeight textFontWeight;
  final bool isEnabled;

  const RoundedElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.width,
    this.height,
    this.borderRadius = 10,
    this.buttonColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.textFontSize = 12, 
    this.textColor = AppColors.customWhite,
    this.textFontWeight = FontWeight.w600,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth.w,
          ),
        ),
        backgroundColor: buttonColor ?? AppColors.primary,
        disabledBackgroundColor: AppColors.primary.withOpacity(0.2),
        fixedSize: Size(width ?? 231.w, height ?? 41.h),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0.dg),
        child: FittedBox(
          child: Text(
            buttonText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: globalTextStyle(
              fontSize: textFontSize.sp,
              color: isEnabled ? textColor : AppColors.primary.withOpacity(0.5),
              fontWeight: textFontWeight,
            ),
          ),
        ),
      ),
    );
  }
}