// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

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
        Container(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            'lib/assets/bonfire.svg',
            width: 28,
            height: 28,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            'lib/assets/dual_icons.svg',
            width: 28,
            height: 28,
          ),
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
