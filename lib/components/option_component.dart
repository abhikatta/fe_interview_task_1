// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyOptionComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyOptionComponent(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 166,
        height: 57,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
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
            // Add your icon or additional elements here if needed
            Text(
              text,
              style: TextStyle(
                color: Color(0xFFC4C4C4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
