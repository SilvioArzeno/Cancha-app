import 'dart:convert';

import 'package:cancha_app/models/reservation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationValidation with ChangeNotifier {
  String _reservationName;
  DateTime _reservationDate;
  DateTimeRange _reservationTime;
  String _rainProbability;
  String _canchaID;
  List<Reservation> _currentReservationList;
  SharedPreferences _prefs;

  //Getters

  String get getCanchaID => _canchaID;
  DateTime get getReservationDate => _reservationDate;
  DateTimeRange get reservationTimeRange => _reservationTime;
  String get rainProb => _rainProbability;
  String get getReservationName => _reservationName;

  //Setters

  void changeCanchaID(String value) {
    _canchaID = value;
  }

  void changeReservationDate(DateTime value) {
    _reservationDate = value;
  }

  void changeReservationTimeRange(DateTime start, DateTime end) {
    DateTimeRange(start: start, end: end);
  }
}
