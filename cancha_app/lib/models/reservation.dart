import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class Reservation extends ChangeNotifier {
  final String reservationName;
  final DateTime reservationDate;
  final DateTimeRange reservationTime;
  final String rainProbability;
  final String canchaID;

  Reservation(
      {this.reservationName,
      this.reservationDate,
      this.reservationTime,
      this.rainProbability,
      this.canchaID});
}
