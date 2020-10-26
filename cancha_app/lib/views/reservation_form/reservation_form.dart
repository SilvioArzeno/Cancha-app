import 'package:cancha_app/components/custom_datepicker.dart';
import 'package:cancha_app/components/custom_dropdown.dart';
import 'package:cancha_app/components/form_app_bar.dart';
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
    print("Form Builded !!!!!");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FormAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomDropdown(
                text: "Cancha",
                options: ['Cancha A', 'Cancha B', 'Cancha C'],
                textIcon: 'ball.svg',
                textDecoration: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF987C06))),
            CustomDatePicker(
                text: "Fecha",
                icon: "date.svg",
                textDecoration: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF987C06)))
          ],
        ),
      ),
    );
  }
}
