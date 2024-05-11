import 'package:cloud_firestore/cloud_firestore.dart';
class ReservationsModel{
String? id;
  String? phone;
  String? name;
  String? date;
  String? type;
  String? submittedDate;
  String? submittedTime;
  //DateTime? testDate;
  ReservationsModel({this.name, this.date, this.type,this.id,this.phone,this.submittedDate,this.submittedTime});

   tojson(){
     return {
       "id":id,
       "phone":phone,
       "name":name,
       "date":date,
       "bookingType":type,
       "submittedDate":submittedDate,
       "submittedTime":submittedTime,
       //"testDate":testDate
     };
   }
   factory ReservationsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){ 
    final data = snapshot.data();
    return ReservationsModel(
      id: data?['id'],
      phone: data?['phone'],
      name: data?['name'],
      date: data?['date'],
      type: data?['bookingType'],
      submittedDate: data?['submittedDate'],
      submittedTime: data?['submittedTime'],
      //testDate: data?['testDate']
    );
   }
}