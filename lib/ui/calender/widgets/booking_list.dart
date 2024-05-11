import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/services/calender_services.dart';
import 'package:faminity/ui/calender/calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingsList extends GetView<CalenderController> {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => CalenderController());
    return 

    Expanded(
              child: StreamBuilder<List<Meeting>>(
                stream: CalenderService()
                    .getDataSourceStream(), // Assuming you have a stream that emits lists of meetings
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final meetings = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showCheckboxColumn: true,
                        columnSpacing: 10,
                        columns: [
                          DataColumn(
                              label: Text(
                            'Name',
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.customBlack),
                          )),
                          DataColumn(
                              label: Text(
                            'Phone',
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.customBlack),
                          )),
                          DataColumn(
                              label: Text(
                            'Date',
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.customBlack),
                          )),
                          DataColumn(
                              label: Text(
                            'Actions',
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.customBlack),
                          )),
                        ],
                        rows: meetings.map<DataRow>((meeting) {
                          return DataRow(
                            cells: [
                              DataCell(Text(meeting.bookingName)),
                              DataCell(Text(meeting.phone)),
                              DataCell(Text(
                                  '${meeting.date.day} ${meeting.date.month} ${meeting.date.year}')),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        FlutterRemix.delete_bin_6_line,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        // CalenderService().deleteBooking(meeting.id);
                                        controller.deleteBooking(meeting.id);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        FlutterRemix.whatsapp_line,
                                        size: 20,
                                        color: AppColors.primary,
                                      ),
                                      onPressed: () {
                                        controller
                                            .launchWhatsapp(meeting.phone);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            );
  }
}