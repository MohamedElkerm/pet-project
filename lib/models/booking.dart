// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  List<BookingElement> booking;

  Booking({
    this.booking,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    booking: List<BookingElement>.from(json["booking"].map((x) => BookingElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "booking": List<dynamic>.from(booking.map((x) => x.toJson())),
  };
}

class BookingElement {
  int id;
  int userId;
  int doctorId;
  String petName;
  DateTime date;
  String time;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  BookingElement({
    this.id,
    this.userId,
    this.doctorId,
    this.petName,
    this.date,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingElement.fromJson(Map<String, dynamic> json) => BookingElement(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    petName: json["pet_name"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "pet_name": petName,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
