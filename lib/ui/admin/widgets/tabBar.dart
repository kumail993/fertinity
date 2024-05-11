// ignore: file_names
import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/ui/admin/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTabBar extends GetView<AdminController> {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => AdminController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            controller.selectedTab.value = 0;
          },
          child: Obx(
            () => Container(
              alignment: Alignment.center,
              width: Get.width * 0.2,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                color: controller.selectedTab.value == 0
                    ? AppColors.primary
                    : AppColors.lightGrey, // Highlight the selected tab
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'All',
                style: globalTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: controller.selectedTab.value == 0
                        ? AppColors.lightGrey
                        : AppColors.primary),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.selectedTab.value = 1;
          },
          child: Obx(
            () => Container(
              alignment: Alignment.center,
              width: Get.width * 0.2,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                color: controller.selectedTab.value == 1
                    ? AppColors.primary
                    : AppColors.lightGrey, // Highlight the selected tab
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Active',
                style: globalTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: controller.selectedTab.value == 1
                        ? AppColors.lightGrey
                        : AppColors.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
