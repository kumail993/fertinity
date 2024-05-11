import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/services/calender_services.dart';
import 'package:faminity/ui/calender/calender_controller.dart';
import 'package:faminity/ui/calender/widgets/modalsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderBooking extends StatelessWidget {
  const CalenderBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      StreamBuilder<List<Meeting>>(
              stream: CalenderService()
                  .getDataSourceStream(), // Assuming you have a stream that emits the list of meetings
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: Get.height * 0.4,
                      child: SfCalendar(
                        todayHighlightColor: AppColors.primary.withOpacity(0.5),
                        headerStyle: CalendarHeaderStyle(
                          textStyle: globalTextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                          backgroundColor: AppColors.customWhite,
                          textAlign: TextAlign.center,
                        ),
                        showCurrentTimeIndicator: true,
                        backgroundColor: AppColors.customWhite,
                        showNavigationArrow: true,
                        cellBorderColor: Colors.transparent,
                        selectionDecoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.customWhite, width: 2),
                        ),
                        view: CalendarView.month,
                        dataSource: MeetingDataSource(snapshot.data!),
                        monthViewSettings: const MonthViewSettings(
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.indicator,
                          navigationDirection:
                              MonthNavigationDirection.horizontal,
                          showTrailingAndLeadingDates: true,
                        ),
                        onTap: (calendarTapDetails) {
                          if (calendarTapDetails.targetElement ==
                              CalendarElement.calendarCell) {
                            final DateTime tappedDate =
                                calendarTapDetails.date!;
                            showModalBottomSheet(
                              backgroundColor: AppColors.background,
                              //isScrollControlled: true,
                              barrierColor: Colors.black45,
                              context: context,
                              builder: (BuildContext context) {
                                return BookingForm(date: tappedDate.toString());
                              },
                            );
                          }
                        },
                      ),
                    ),
                  );
                }
              },
            );

  }
}