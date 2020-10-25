import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
