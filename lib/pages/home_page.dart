import 'package:fe_interview_task_1/components/bottom_nav_bar.dart';
import 'package:fe_interview_task_1/components/bottom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String time = '22h 00m';
  final num peopleCount = 103;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        height: 45,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: const BoxDecoration(
          color: Color(0xFF0F1115),
        ),
        child: const MyBottomNavBar(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/background.png',
            fit: BoxFit.cover,
          ),
          SvgPicture.asset(
            'lib/assets/fade.svg',
            fit: BoxFit.cover,
          ),
          Center(
              child: Column(children: [
            const Padding(padding: EdgeInsets.only(top: 59)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left: 20)),
                const Text('Stroll Bonfire',
                    style: TextStyle(
                      fontSize: 34,
                      color: Color(0xFFCCC8FF),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'ProximaNova',
                      shadows: [
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 7.9,
                          color: Color.fromRGBO(0, 0, 0, 0.20),
                        ),
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 2,
                          color: Color(0xFFBEBEBE),
                        ),
                        Shadow(
                          offset: Offset(0, 0.999),
                          blurRadius: 2,
                          color: Color.fromRGBO(36, 35, 47, 0.50),
                        ),
                      ],
                    )),
                SvgPicture.asset(
                  'lib/assets/dropdown_arrow.svg',
                  width: 40.0,
                  height: 40.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'lib/assets/clock.svg',
                  width: 13.0,
                  height: 15.0,
                ),
                const SizedBox(width: 3.27),
                Text(
                  time,
                  style: const TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 9.73),
                SvgPicture.asset(
                  'lib/assets/person.svg',
                  width: 10.0,
                  height: 13.0,
                ),
                Text(
                  peopleCount.toString(),
                  style: const TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ])),
          Positioned(
            bottom: 00,
            left: 0,
            right: 0,
            child: MyBottomSection(),
          ),
        ],
      ),
    ));
  }
}
