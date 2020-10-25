import 'package:cancha_app/components/form_app_bar.dart';
import 'package:cancha_app/components/main_app_bar.dart';
import 'package:flutter/material.dart';

class ReservationForm extends StatefulWidget {
  ReservationForm({Key key}) : super(key: key);

  static String routeName = "/ReservationForm";

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormAppBar(),
      body: Container(),
    );
  }
}
