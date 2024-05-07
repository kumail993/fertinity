import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationsModel{
  int? id;
  String? phone;
  String? name;
  String? date;
  String? type;
  ReservationsModel({this.name, this.date, this.type,this.id,this.phone});

   tojson(){
     return {
       "id":id,
       "phone":phone,
       "name":name,
       "date":date,
       "bookingType":type
     };
   }
   factory ReservationsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){ 
    final data = snapshot.data();
    return ReservationsModel(
      id: data?['id'],
      phone: data?['phone'],
      name: data?['name'],
      date: data?['date'],
      type: data?['bookingType']
    );
   }
}