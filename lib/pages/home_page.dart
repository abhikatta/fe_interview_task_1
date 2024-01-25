import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(title: const Text('Stroll Bonfire')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Text('Stroll Bonfire'),
          Image.asset(
            'lib/assets/background.png',
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
                const Text(
                  '22h 00m',
                  style: TextStyle(
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
                const Text(
                  '103',
                  style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ])),
        ],
      ),
    ));
  }
}
