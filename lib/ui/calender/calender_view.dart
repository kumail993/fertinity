import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/ui/calender/calender_controller.dart';
import 'package:faminity/ui/calender/widgets/booking_list.dart';
import 'package:faminity/ui/calender/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderView extends GetView<CalenderController> {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => CalenderController());
    //Get.putOrFind(() => AdminController());

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: 
      Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
             CalenderBooking(),
             BookingsList(),
      
            // Expanded(
            //   child: FutureBuilder<List<Meeting>>(
            //     future: CalenderService().getDataSource(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text('Error: ${snapshot.error}'),
            //         );
            //       } else {
            //         final meetings = snapshot.data!;
            //         return SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: DataTable(
            //             columnSpacing: 10,
      
            // columns: [
            //   DataColumn(label: Text('Name')),
            //   DataColumn(label: Text('Phone')),
            //   DataColumn(label: Text('Date')),
            //   DataColumn(label: Text('Actions')),
            // ],
            // rows: meetings.map<DataRow>((meeting) {
            //   return DataRow(
            //     cells: [
            //       DataCell(Text(meeting.bookingName)),
            //       DataCell(Text(meeting.phone)),
            //       DataCell(Text('${meeting.date.day} ${meeting.date.month} ${meeting.date.year}')),
            //       DataCell(
            //         Row(
            //           children: [
            //             IconButton(
            //               icon: const Icon(FlutterRemix.delete_bin_6_line,size: 20,color: Colors.red,),
            //               onPressed: () {
            //                 // CalenderService().deleteBooking(meeting.id);
            //                 controller.deleteBooking(meeting.id);
            //               },
            //             ),
            //             IconButton(
            //               icon: const Icon(FlutterRemix.whatsapp_line,size: 20,color: AppColors.primary,),
            //               onPressed: () {
            //                controller.launchWhatsapp(meeting.phone);
            //               },
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   );
            // }).toList(),
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
      
            //      Expanded(
            //   child: FutureBuilder<List<Meeting>>(
            //     future: CalenderService().getDataSource(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text('Error: ${snapshot.error}'),
            //         );
            //       } else {
            //         final reservations = snapshot.data!;
            //         return ListView.builder(
            //           itemCount: reservations.length,
            //           itemBuilder: (context, index) {
            //             final reservation = reservations[index];
            //             return
            //             Container(
            //               margin: const EdgeInsets.all(8.0),
            //               color: AppColors.customWhite,
            //               child: Column(
      
            //                 children: [
            //                   Text(reservation.bookingName),
            //                   Text(reservation.phone),
            //                   Text('${reservation.date.day} ${reservation.date.month} ${reservation.date.year}'),
            //                   Text(reservation.type),
            //                   Text(reservation.id),
            //                 ],
      
            //               )
            //             );
            //           },
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: Get.height * 0.4,
      //         width: Get.width,
      //         child: SfCalendar(
      //           showNavigationArrow: true,
      //             todayHighlightColor: AppColors.primary,
      //             //backgroundColor: AppColors.customBlack,
      //             view: CalendarView.month,
      //             dataSource: MeetingDataSource(controller.getDataSource()),
      //             monthViewSettings: const MonthViewSettings(
      //               //showAgenda: true,
      //             appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
      //   )
      //       ),
      //       SizedBox(height: 20.h,),
      //       Expanded(
      //         flex: 5,
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 20),
      //           child: ListView.builder(
      //             itemCount: controller.meetings.length,
      //             itemBuilder: (context, index) {
      //               final booking = controller.meetings[index];
      //               return ListTile(
      //                 title: Text(booking.bookingName),
      //                 subtitle: Column(
      //                   children: [
      //                     Text(booking.bookingName),
      //                     Text(
      //                       booking.date.day.toString()+"/"+booking.date.month.toString()+"/"+booking.date.year.toString(),),
      //                   ],
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
