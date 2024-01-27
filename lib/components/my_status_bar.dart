import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyStatusBar extends StatelessWidget {
  final String name;
  final num age;

  const MyStatusBar({
    super.key,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            height: 20,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 160,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD2D2D2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 160,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0x87878780),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                'lib/assets/navigation_go_back.svg',
                width: 44,
                height: 44,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'lib/assets/more_options.svg',
                  width: 26,
                  height: 26,
                ),
              ),
              const SizedBox(width: 11),
            ],
            title: Text(
              '$name, $age',
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFFF5F5F5),
                fontWeight: FontWeight.w700,
                fontFamily: 'ProximaNova',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
