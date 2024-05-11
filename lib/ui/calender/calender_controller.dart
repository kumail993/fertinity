import 'package:faminity/services/booking_services.dart';
import 'package:faminity/ui/common/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart'; // Ensure you have imported the Syncfusion calendar package

class CalenderController extends GetxController {

   BookingServices bookingServices = BookingServices();


   void deleteBooking(String bookingId) {
      BookingServices.deleteBooking(bookingId);
    }

     bool isBookingDatePassed(DateTime submittedDate) {
      DateTime currentDate = DateTime.now();
      DateTime bookingDate = submittedDate; // Assuming `submittedDate` is the field containing the booking date
      return bookingDate.isBefore(currentDate);
    }

    Future<void> launchWhatsapp( String? phone) async {
      final link = WhatsAppUnilink(
        phoneNumber: phone,
        text: 'Hello, I am interested in your service. Please contact me.',
      );
      final uri = Uri.parse(link.toString());
      if(await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        showToast('Unable to open whatsapp');
      }
    }


}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].date;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].bookingName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.bookingName, this.to,this.date, this.background, this.phone, this.id, this.type, this.isAllDay);
  String bookingName;
  DateTime date;
  String phone;
  String id;
  String type;
  DateTime to;
  Color background;
  bool isAllDay;
}