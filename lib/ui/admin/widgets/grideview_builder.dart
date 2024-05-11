import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/models/reservations_model.dart';
import 'package:faminity/ui/admin/admin_controller.dart';
import 'package:faminity/ui/admin/compoments/gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingGrid extends GetView<AdminController> {
  const BookingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => AdminController());
    return Obx(() => StreamBuilder<List<ReservationsModel>>(
        //future: controller.selectedTab.value == 0 ? controller.fetchBookings() : controller.fetchActiveBookings(),
        stream: controller.selectedTab.value == 0
            ? controller.fetchBookings()
            : controller.fetchActiveBookingsStream(),
        builder: (context, AsyncSnapshot<List<ReservationsModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
          if (snapshot.hasData) {
            snapshot.data!
                .sort((a, b) => b.submittedDate!.compareTo(a.submittedDate!));
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
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
        }));
  }
}
