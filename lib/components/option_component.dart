// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyOptionComponent extends StatelessWidget {
  final String option;
  final String choice;
  final VoidCallback onPressed;
  final bool selected;
  const MyOptionComponent(
      {super.key,
      required this.choice,
      required this.option,
      required this.onPressed,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            width: 166,
            height: 57,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: selected ? Color(0xFF8B88EF) : Colors.transparent),
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF232A2E),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-1, -1),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.30),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  color: Color(0xFF484848).withOpacity(0.30),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.30),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color:
                            selected ? Colors.transparent : Color(0xFFC4C4C4)),
                    color: selected == true
                        ? Color(0xFF8B88EF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'ProximaNova',
                        color: Color(0xFFC4C4C4)),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Text(
                  choice,
                  style: TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.1),
                )),
              ],
            )));
  }
}
