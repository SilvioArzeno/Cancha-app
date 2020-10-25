import 'package:flutter/material.dart';

class FormAppBar extends StatelessWidget with PreferredSizeWidget {
  const FormAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          "Nueva Reserva",
          maxLines: 2,
          style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xFFFFA901),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(35))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}
