import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/models/reservations_model.dart';
import 'package:faminity/services/booking_services.dart';
import 'package:faminity/ui/admin/admin_controller.dart';
import 'package:faminity/ui/widgets/card_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GridItem extends GetView<AdminController> {
  final ReservationsModel reservation;
  const GridItem({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => AdminController());
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Name:',
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Type:',
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Date:',
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Phone:',
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary),
                    textAlign: TextAlign.left,
                  ),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    reservation.name!,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.customBlack),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    reservation.type!,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.customBlack),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    reservation.date!,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.customBlack),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    reservation.phone!,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.customBlack),
                    textAlign: TextAlign.left,
                  ),
                ]),
              ]),
              const SizedBox(height: 15,),
              Obx(() =>
                  // ignore: unrelated_type_equality_checks
                  controller.selectedTab == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                                imagepath: 'assets/icons/correct.svg',
                                color: Colors.green.withOpacity(0.5),
                                onPressed: () {
                                  BookingServices.updateBookingStatus(
                                      reservation.id.toString());
                                }),
                            CustomButton(
                                imagepath: 'assets/icons/cancel.svg',
                                color: Colors.red.withOpacity(0.5),
                                onPressed: () {
                                  BookingServices.deleteBooking(
                                      reservation.id.toString());
                                })
                          ],
                        )
                      : Expanded(
                          child: TextButton(
                              onPressed: () {
                                BookingServices.deleteBooking(
                                    reservation.id.toString());
                              },
                              child: Text(
                                'Delete',
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                                textAlign: TextAlign.left,
                              ))))
            ],
          ),
        ));
  }
}
