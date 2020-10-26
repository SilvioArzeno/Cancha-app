import 'package:cancha_app/models/reservation.dart';
import 'package:flutter/material.dart';

class ReservationValidation with ChangeNotifier {
  Reservation _currentReservation = Reservation();

  //Getters

  String get canchaID => _currentReservation.canchaID;
}
