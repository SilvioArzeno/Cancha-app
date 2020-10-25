import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyReservationList extends StatelessWidget {
  const EmptyReservationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "No hay reservaciones proximas",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF987C06)),
        ),
        SvgPicture.asset('lib/resources/images/icons/NoReservationsIcon.svg'),
      ])),
    );
  }
}
