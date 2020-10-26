import 'package:cancha_app/components/custom_datepicker.dart';
import 'package:cancha_app/components/custom_dropdown.dart';
import 'package:cancha_app/components/custom_input.dart';
import 'package:cancha_app/components/custom_timepicker.dart';
import 'package:cancha_app/components/form_app_bar.dart';
import 'package:cancha_app/providers/reservation_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => ReservationValidation(),
      child: Consumer<ReservationValidation>(
        builder: (context, provider, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: FormAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
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
                  SizedBox(
                    height: 15,
                  ),
                  CustomDatePicker(
                      text: "Fecha",
                      icon: "date.svg",
                      textDecoration: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF987C06))),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTimePicker(
                      text: "Hora",
                      icon: "clock.svg",
                      textDecoration: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF987C06))),
                  SizedBox(
                    height: 15,
                  ),
                  CustomInput(
                    text: "Nombre del reservante",
                    icon: "person.svg",
                    textDecoration: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF987C06)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    color: Color(0xFFFFA901),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          "Confirmar",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    onPressed: () {
                      String error;
                      if (error == null) {
                        Navigator.pop(context);
                      } else
                        AlertDialog(
                          content: Center(child: Text("$error")),
                        );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
