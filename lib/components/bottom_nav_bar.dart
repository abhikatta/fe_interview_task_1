// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});
  final num messageCount = 10;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            'lib/assets/poker_cards.svg',
            width: 28,
            height: 28,
          ),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'lib/assets/bonfire.svg',
                width: 28,
                height: 28,
              ),
            ),
            Positioned(
              top: 4,
              right: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFB5B2FF), // Adjust color as needed
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '   ',
                  style: TextStyle(
                    color: Color(0xFF0F1115),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'ProximaNova',
                    fontSize: 7,
                  ),
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'lib/assets/chat.svg',
                width: 28,
                height: 28,
              ),
            ),
            Positioned(
              top: 4,
              right: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFB5B2FF), // Adjust color as needed
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  messageCount.toString(),
                  style: const TextStyle(
                    color: Color(0xFF0F1115),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'ProximaNova',
                    fontSize: 7,
                  ),
                ),
              ),
            ),
          ],
        ),

        // values are different because in the figma design
        // this is an icon with no padding unlike the others.

        Container(
          // padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            'lib/assets/user.svg',
            width: 44,
            height: 44,
          ),
        )
      ],
    );
  }
}
