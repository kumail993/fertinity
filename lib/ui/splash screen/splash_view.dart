import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/ui/splash%20screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.only(left: 50,right: 50),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color:AppColors.customWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const SizedBox.shrink(),
              SvgPicture.asset(
                'assets/images/testing.svg',
                height: 100.h,
                color: AppColors.primary,
              ),
              SvgPicture.asset(
                'assets/images/name.svg',
                height: 100.h,
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }
}