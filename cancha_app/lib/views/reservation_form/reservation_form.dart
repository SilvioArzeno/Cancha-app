import 'package:cancha_app/components/custom_dropdown.dart';
import 'package:cancha_app/components/form_app_bar.dart';
import 'package:cancha_app/components/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Colors.white,
      appBar: FormAppBar(),
      body: Column(
        children: [
          CustomDropdown(
            text: "Cancha",
            options: ['Cancha A', 'Cancha B', 'Cancha C'],
            textColor: Color(0xFFFFA901),
          )
        ],
      ),
    );
  }
}
