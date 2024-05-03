class ReservationsModel{
  int id;
  String name;
  String date;
  String type;
  ReservationsModel(this.name, this.date, this.type,this.id);

  ReservationsModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date = json['date'],
        type = json['booking_type'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'date': date,
    'booking_type': type,
    'id': id
  };
}