import 'package:faminity/aap/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  // ignore: prefer_typing_uninitialized_variables
  final imagepath;
  final double borderRadius;
  final double padding;

  // ignore: prefer_const_constructors_in_immutables
  CustomButton({super.key, 
    required this.onPressed,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.padding = 10,
    this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Get.width*0.1,
        height: Get.height*0.1,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle

        ),
        child: SvgPicture.asset(imagepath,color: AppColors.customWhite,height: 100.h,width: 100.w,)
        
      ),
    );
  }
}
