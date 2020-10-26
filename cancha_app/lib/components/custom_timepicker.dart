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

import 'package:cancha_app/providers/reservation_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomTimePicker extends StatefulWidget {
  CustomTimePicker({
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
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  String _startTime;
  String _endTime;

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ReservationValidation>(context);
    print("Time picker build");
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
            height: widget.inputHeight ?? currentScreen.height * 0.06,
            child: Row(children: [
              Expanded(
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
                        Text(_startTime == null ? "" : "$_startTime",
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
                        child: Scaffold(
                          appBar: AppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: Color(0xFF987C06),
                              title: Text("${widget.text}"),
                              actions: [
                                IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: () {
                                      if (_startTime == null) {
                                        _startTime = DateTime.now()
                                            .add(Duration(
                                                hours: 1,
                                                minutes: (60 -
                                                    DateTime.now().minute)))
                                            .toIso8601String();
                                      }
                                      setState(() {
                                        _startTime = DateFormat.Hm().format(
                                            DateTime.tryParse(this._startTime));
                                      });
                                      Navigator.pop(context);
                                    })
                              ]),
                          body: CupertinoDatePicker(
                            use24hFormat: true,
                            minuteInterval: 30,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now().add(Duration(
                                hours: 1,
                                minutes: (60 - DateTime.now().minute))),
                            onDateTimeChanged: (value) {
                              _startTime = value.toIso8601String();
                            },
                          ),
                        )),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 50,
              ),
              Expanded(
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
                        Text(_endTime == null ? "" : "$_endTime",
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
                        child: Scaffold(
                          appBar: AppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: Color(0xFF987C06),
                              title: Text("${widget.text}"),
                              actions: [
                                IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: () {
                                      if (_endTime == null) {
                                        _endTime = DateTime.now()
                                            .add(Duration(
                                                hours: 1,
                                                minutes: (60 -
                                                    DateTime.now().minute)))
                                            .toIso8601String();
                                      }
                                      validationService.changeReservationTimeRange(
                                          DateTime.tryParse(
                                              "2020-10-26T$_startTime:00.000"),
                                          DateTime.tryParse(_endTime));
                                      setState(() {
                                        _endTime = DateFormat.Hm().format(
                                            DateTime.tryParse(this._endTime));
                                      });
                                      Navigator.pop(context);
                                    })
                              ]),
                          body: CupertinoDatePicker(
                            use24hFormat: true,
                            minuteInterval: 30,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now().add(Duration(
                                hours: 1,
                                minutes: (60 - DateTime.now().minute))),
                            onDateTimeChanged: (value) {
                              _endTime = value.toIso8601String();
                            },
                          ),
                        )),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
