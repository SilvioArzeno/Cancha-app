import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormAppBar extends StatelessWidget with PreferredSizeWidget {
  const FormAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      automaticallyImplyLeading: false,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Row(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(
            "lib/resources/images/icons/ball.svg",
            height: 100,
            width: 100,
            color: Color(0xFFB57402),
          ),
          Flexible(
            child: Text(
              "Nueva Reserva",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ]),
      ]),
      backgroundColor: Color(0xFFFFA901),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(165);
}
