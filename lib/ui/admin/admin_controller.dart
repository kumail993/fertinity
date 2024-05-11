import 'package:faminity/models/reservations_model.dart';
import 'package:faminity/services/booking_services.dart';
import 'package:faminity/ui/common/toast.dart';
import 'package:faminity/ui/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class AdminController extends GetxController {

  RxInt selectedTab = 0.obs;
  BookingServices bookingServices = BookingServices();

  Stream<List<ReservationsModel>> fetchBookings() {
  return bookingServices.getBookingsStream();
}

  Stream<List<ReservationsModel>> fetchActiveBookingsStream() {
  return bookingServices.getActiveBookingsStream();
}

//Rx<DateTime> currentDate = DateTime.now().obs;

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

    void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginView());
  }

  @override
  void onInit() async {
    super.onInit();
  }
}