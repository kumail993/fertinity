import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  PreferredSize build(BuildContext context) {
    return 
     PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      color: AppColors.primary, // Customize the background color as needed
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: 10.h, right: 10.h,bottom: 10.h),
      child: Text(
        'FARMINITY',
        style: globalTextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,  
            color: AppColors.lightGrey),
      ),
    ),
  );
  }
}