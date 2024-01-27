import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioRecordingPage extends StatelessWidget {
  final String name = 'Angelina';
  final num age = 28;
  const AudioRecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 3,
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
          // ClipRect(
          // child:
          Positioned(
            left: -39,
            width: 476,
            height: 605,
            child: Image.asset(
              'lib/assets/human.png',
              fit: BoxFit.fill,
              // width: ,
            ),
          ),
          // ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'lib/assets/record_fade_over.svg',
              fit: BoxFit.cover,
              // height: 200,
            ),
          ),

          Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  '$name, $age',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF5F5F5),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'ProximaNova',
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
