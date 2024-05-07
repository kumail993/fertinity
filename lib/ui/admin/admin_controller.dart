import 'package:faminity/models/reservations_model.dart';
import 'package:faminity/services/booking_services.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {

  RxInt selectedTab = 0.obs;
  final RxList<ReservationsModel> categories = <ReservationsModel>[].obs;

  BookingServices bookingServices = BookingServices();


  // Future<List<ReservationsModel>> fetchBookings() async {
  //   return await BookingServices.getBookings();
  // }

  // Future<List<ReservationsModel>> fetchActiveBookings() async {
  //   return await BookingServices.getActiveBookings();
  // }

  Stream<List<ReservationsModel>> fetchBookings() {
  return bookingServices.getBookingsStream();
}

  Stream<List<ReservationsModel>> fetchActiveBookingsStream() {
  return bookingServices.getActiveBookingsStream();
}

  @override
  void onInit() async {
    super.onInit();
  }
}