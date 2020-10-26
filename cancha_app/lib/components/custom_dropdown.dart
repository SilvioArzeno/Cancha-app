import 'package:cancha_app/providers/reservation_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatefulWidget {
  final String textIcon;
  final Icon buttonIcon;
  final double height;
  final double width;
  final String text;
  final List<String> options;
  final Color textColor;
  final Function onChanged;
  final TextStyle textDecoration;
  final TextDecoration inputTextDecoration;
  final double textSize;
  final String selectedItem;

  const CustomDropdown({
    Key key,
    this.textIcon,
    this.buttonIcon,
    @required this.text,
    @required this.options,
    this.height,
    this.width,
    this.selectedItem,
    this.onChanged,
    this.textDecoration,
    this.inputTextDecoration,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String currentItem;
  int selectedIndex;
  @override
  void initState() {
    super.initState();
    currentItem = widget.selectedItem;
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ReservationValidation>(context);

    print("Selector Rebuild");
    Size screenSize = MediaQuery.of(context).size;
    List<Widget> children = new List<Widget>();
    widget.options.forEach((element) {
      children.add(Text(element,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF987C06),
          )));
    });
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              if (widget.textIcon != null)
                SvgPicture.asset(
                    "lib/resources/images/icons/${widget.textIcon}",
                    height: 35,
                    width: 35,
                    color: Color(0xFF987C06)),
              SizedBox(
                width: 15,
              ),
              Text(
                "${widget.text}",
                style: (widget.textDecoration ??
                    TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: widget.textSize ?? 14,
                        fontWeight: FontWeight.bold,
                        color: widget.textColor ?? Colors.white)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Container(
              height: screenSize.height * 0.05,
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
                  Text(currentItem == null ? "" : "$currentItem",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 22,
                        color: Colors.black,
                      )),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            onTap: () => {
              showModalBottomSheet(
                builder: (context) => Container(
                  height: screenSize.height * 0.35,
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      title: Text(
                        "${widget.text}",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF987C06),
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: Icon(
                            Icons.check,
                            color: Color(0xFF987C06),
                            size: 32.0,
                          ),
                          onPressed: () {
                            setState(() {
                              currentItem = widget.options[selectedIndex];
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    body: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: widget.options.indexOf("$currentItem"),
                      ),
                      itemExtent: 60,
                      onSelectedItemChanged: (value) {
                        selectedIndex = value;
                      },
                      children: children,
                    ),
                  ),
                ),
                context: context,
              )
            },
          )
        ],
      ),
    );
  }
}
