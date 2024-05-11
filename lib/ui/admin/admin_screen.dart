import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/ui/admin/admin_controller.dart';
import 'package:faminity/ui/admin/widgets/grideview_builder.dart';
import 'package:faminity/ui/admin/widgets/tabBar.dart';
import 'package:faminity/ui/calender/calender_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminPanel extends GetView<AdminController> {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => AdminController());
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(
            'FARMINITY',
            style: globalTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.lightGrey),
          ),
          leading: IconButton(
              icon: const Icon(FlutterRemix.calendar_2_line,
                  color: AppColors.lightGrey),
              onPressed: () {
                Get.to(() => const CalenderView());
              }),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                  onTap: () {
                    controller.logout();
                  },
                  child: Text(
                    'Logout',
                    style: globalTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightGrey),
                  )),
            ),
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            children: [
              const HomeTabBar(),
              SizedBox(
                height: 20.h,
              ),
              const BookingGrid()
            ],
          ),
        ));
  }
}
