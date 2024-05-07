import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/models/reservations_model.dart';
import 'package:faminity/ui/admin/admin_controller.dart';
import 'package:faminity/ui/admin/compoments/gridview.dart';
import 'package:flutter/material.dart';
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
          centerTitle: true,
          title: Text(
            'FARMINITY',
            style: globalTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.lightGrey),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
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
                              : AppColors
                                  .lightGrey, // Highlight the selected tab
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
                              : AppColors
                                  .lightGrey, // Highlight the selected tab
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
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(() => StreamBuilder<List<ReservationsModel>>(
                  //future: controller.selectedTab.value == 0 ? controller.fetchBookings() : controller.fetchActiveBookings(),
                  stream: controller.selectedTab.value == 0
                      ? controller.fetchBookings()
                      : controller.fetchActiveBookingsStream(),
                  builder: (context,
                      AsyncSnapshot<List<ReservationsModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }
                    if (snapshot.data!.isEmpty){

                      return const Center(
                        child: Text('No Data'),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio:1,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.0.h,
                                  crossAxisSpacing: 5.0.w),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final booking = snapshot.data![index];
                            return GridItem(reservation: booking);
                          });
                    }
                    return const Center(
                      child: Text('No Data'),
                    );
                  })),
            ],
          ),
        ));
  }
}
