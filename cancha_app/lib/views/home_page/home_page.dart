import 'dart:convert';

import 'package:cancha_app/components/empty_reservation.dart';
import 'package:cancha_app/components/main_app_bar.dart';
import 'package:cancha_app/models/reservation.dart';
import 'package:cancha_app/views/reservation_form/reservation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.preferences}) : super(key: key);

  final SharedPreferences preferences;

  static String routeName = "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Reservation> _reservationList = [];
  SharedPreferences _prefs;
  @override
  void initState() {
    super.initState();
    _prefs = widget.preferences;
    _getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      body: _reservationList.isEmpty
          ? EmptyReservationList()
          : Center(child: Text("Hay Algo")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFA901),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () =>
            Navigator.pushNamed(context, ReservationForm.routeName),
      ),
    );
  }

  _getReservations() async {
    if (_prefs.containsKey("reservations") != null &&
        _prefs.get("reservations") != null) {
      _reservationList = jsonDecode(_prefs.get("reservation"));
    }
  }
}
