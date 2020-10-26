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
  List<Reservation> _currentReservationList = [];
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
    _reservationTime = DateTimeRange(start: start, end: end);
  }

  void changeRainProb(int rainProb) {
    _rainProbability = rainProb.toString();
  }

  void changeReservationName(String value) {
    _reservationName = value;
  }

  void setPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> submitForm() async {
    String errorMsg;

    if (_canchaID != null &&
        _reservationDate != null &&
        _reservationTime != null &&
        _reservationName != null &&
        _rainProbability != null) {
      if (_prefs != null) {
        if (_prefs.containsKey("reservations") != null &&
            _prefs.get("reservations") != null) {
          _currentReservationList = _prefs.get("reservations");
        }
      }
      int counterA = 0;
      int counterB = 0;
      int counterC = 0;
      _currentReservationList.forEach((element) {
        switch (element.canchaID) {
          case "Cancha A":
            counterA++;
            break;
          case "Cancha B":
            counterB++;
            break;
          case "Cancha C":
            counterC++;
            break;
        }
      });
      Reservation newReservation = Reservation(
          canchaID: _canchaID,
          reservationDate: _reservationDate,
          reservationTime: _reservationTime,
          reservationName: _reservationName,
          rainProbability: _rainProbability);

      if ((_canchaID == "Cancha A" && counterA >= 3) ||
          (_canchaID == "Cancha B" && counterB >= 3) ||
          (_canchaID == "Cancha C" && counterC >= 3)) {
        errorMsg = "Esta cancha ya tiene tres reservas";
      } else {
        _currentReservationList.add(newReservation);
        // _prefs.setString("reservations", jsonEncode(_currentReservationList));
      }
    }

    return errorMsg;
  }
}
