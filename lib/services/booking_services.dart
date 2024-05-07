import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faminity/models/reservations_model.dart';
import 'package:faminity/ui/common/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BookingServices {

  
  static Future<List<ReservationsModel>> getBookings() async {


    final snapshot = await FirebaseFirestore.instance.collection("BookingData").where('activeStatus', isEqualTo: false).get();
    final userData = snapshot.docs.map((e) => ReservationsModel.fromSnapshot(e)).toList();
    return userData;
  }

  Stream<List<ReservationsModel>> getBookingsStream() {
  return FirebaseFirestore.instance
      .collection("BookingData")
      .where('activeStatus', isEqualTo: false)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => ReservationsModel.fromSnapshot(doc)).toList());
}

  static Future<List<ReservationsModel>> getActiveBookings() async {


    final snapshot = await FirebaseFirestore.instance.collection("BookingData").where('activeStatus', isEqualTo: true).get();
    final userData = snapshot.docs.map((e) => ReservationsModel.fromSnapshot(e)).toList();
    return userData;
  }

  Stream<List<ReservationsModel>> getActiveBookingsStream() {
  return FirebaseFirestore.instance
      .collection("BookingData")
      .where('activeStatus', isEqualTo: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => ReservationsModel.fromSnapshot(doc)).toList());
}


  static Future<void> deleteBooking(String id) async {

    EasyLoading.show();
  try {

    // Get reference to the document with the provided ID
    final bookingRef = FirebaseFirestore.instance.collection("BookingData").doc(id);

    // Check if the document exists
    final docSnapshot = await bookingRef.get();
    if (docSnapshot.exists) {
      // Delete the document
      showToast('Booking deleted successfully');
      await bookingRef.delete();
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  } catch (e) {
    EasyLoading.dismiss();
    showToast('Server Error');
    // Handle errors as per your application's requirements
  }
}

static Future<void> updateBookingStatus(String id) async {
  EasyLoading.show();
  try {
    // Get reference to the document with the provided ID
    final bookingRef = FirebaseFirestore.instance.collection("BookingData").doc(id);

    // Check if the document exists
    final docSnapshot = await bookingRef.get();
    if (docSnapshot.exists) {
      // Update the activeStatus field to true
      await bookingRef.update({
        'activeStatus': true,
      });
      EasyLoading.dismiss();
      showToast('Booking status updated successfully');
    } else {
      EasyLoading.dismiss();
    }
  } catch (e) {
    EasyLoading.dismiss();
    showToast('Server Error');
    // Handle errors as per your application's requirements
  }
}

}
