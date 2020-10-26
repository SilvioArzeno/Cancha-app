// Author: Silvio Arzeno
//
// Date: 8/3/2020
//
// Description: A generic Input Widget that takes Icon, text , IsPassword
// As well as preffered text color or text decoration. Default Values are
// Icon: WhiteProfileIcon.svg
// Text: Correo/ Usuario
// Text Decorations: Monserrat, White, 16, Bold
//
// Change Log:
// -8/3/2020 Silvio Arzeno: Widget created
//

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({
    Key key,
    this.icon,
    @required this.text,
    this.textColor,
    this.textDecoration,
    this.inputHeight,
    this.inputWidth,
    this.textSize,
    this.onChanged,
    this.selectedDate,
  }) : super(key: key);

  final String icon;
  final String text;
  final Color textColor;
  final TextStyle textDecoration;
  final double inputHeight;
  final double inputWidth;
  final double textSize;
  final Function onChanged;
  final DateTime selectedDate;

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String _formattedDate;
  @override
  Widget build(BuildContext context) {
    print("Date picker build");
    Size currentScreen = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              if (widget.icon != null)
                SvgPicture.asset("lib/resources/images/icons/${widget.icon}",
                    height: 35, width: 35, color: Color(0xFF987C06)),
              if (widget.icon != null) Spacer(),
              Text(
                "${widget.text}",
                style: (widget.textDecoration ??
                    TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: widget.textSize ?? 16,
                      fontWeight: FontWeight.bold,
                      color: widget.textColor ?? Colors.white,
                    )),
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
          SizedBox(
            height: currentScreen.height * 0.005,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 10),
                  color: Color(
                    0x40000000,
                  ),
                )
              ],
            ),
            height: widget.inputHeight ?? currentScreen.height * 0.06,
            child: GestureDetector(
              child: Container(
                height: currentScreen.height * 0.35,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(0, 10),
                      color: Color(0x40000000),
                    )
                  ],
                  color: Color(0xFFD7D2D2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formattedDate == null ? "" : "$_formattedDate",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 22,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: currentScreen.height * 0.40,
                  child: DatePickerWidget(
                    onConfirm: (value, indexes) {
                      setState(() {
                        _formattedDate = DateFormat.yMMMd().format(value);
                      });
                    },
                    dateFormat: 'dd/MM/yyyy',
                    minDateTime: DateTime.now(),
                    pickerTheme: DateTimePickerTheme(
                      confirmTextStyle: TextStyle(color: Color(0xFF987C06)),
                      itemTextStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF987C06),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
