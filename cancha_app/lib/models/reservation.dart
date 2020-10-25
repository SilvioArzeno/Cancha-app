import 'package:flutter/material.dart';

class Reservation {
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
