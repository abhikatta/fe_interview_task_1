import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final String imagePath;
  const MyAvatar({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath,
          height: 53.702,
          width: 53.702,
          fit: BoxFit.cover, // Adjust the fit as needed
        ),
      ),
    );
  }
}
