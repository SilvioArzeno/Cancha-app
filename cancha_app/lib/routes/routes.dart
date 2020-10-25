import 'package:cancha_app/views/home_page/home_page.dart';
import 'package:cancha_app/views/reservation_form/reservation_form.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (BuildContext context) => HomePage(),
  ReservationForm.routeName: (BuildContext context) => ReservationForm(),
};
