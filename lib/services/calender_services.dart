import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faminity/aap/color_theme.dart';
// ignore: library_prefixes
import 'package:faminity/models/reservations_model.dart' as Reservations;
// ignore: library_prefixes
import 'package:faminity/ui/calender/calender_controller.dart' as Calender;
import 'package:flutter/material.dart';

class CalenderService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Calender.Meeting>> getDataSourceStream() async* {
    yield* _firestore
        .collection("BookingData")
        .where('activeStatus', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Reservations.ReservationsModel.fromSnapshot(doc))
            .map((reservation) {
          final DateTime date = DateTime.parse(reservation.date!);
          return Calender.Meeting(
            reservation.name!,
            date,
            date.add(const Duration(days: 0)),
            AppColors.primary,
            reservation.phone!,
            reservation.id!,
            reservation.type!,
            true,
          );
        }).toList());
  }
}
