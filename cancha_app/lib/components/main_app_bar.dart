import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget with PreferredSizeWidget {
  const MainAppbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          "Reservaciones",
          style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xFFFFA901),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
