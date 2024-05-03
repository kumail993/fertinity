import 'package:faminity/models/reservations_model.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {


  RxList<ReservationsModel> reservations = [

    ReservationsModel('Ismail', '20/3/2024','Night', 1),
     ReservationsModel('Kumail', '20/3/2024','Day', 1),
      ReservationsModel('Fiazan', '20/3/2024','Night', 1),
       ReservationsModel('Asad', '20/3/2024','Day', 1)
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }
}