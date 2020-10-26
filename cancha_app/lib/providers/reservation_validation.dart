import 'dart:convert';

import 'package:cancha_app/models/reservation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationValidation with ChangeNotifier {
  String reservationName;
  DateTime reservationDate;
  DateTimeRange reservationTime;
  String rainProbability;
  String canchaID;
  List<Reservation> _currentReservationList;
  SharedPreferences _prefs;

  //Getters

  String get getCanchaID => canchaID;
  DateTime get getReservationDate => reservationDate;
  DateTimeRange get reservationTimeRange => reservationTime;
  String get rainProb => rainProbability;
  String get getReservationName => reservationName;

  //Setters

  void changeCanchaID(String value) {
    canchaID = value;
  }

  void changeReservationDate(DateTime value) {}
}
