import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
        centerTitle: true,
        title: Text('FARMINITY',style: globalTextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.lightGrey),),
      );
  }
}