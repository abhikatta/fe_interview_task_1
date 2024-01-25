import 'package:fe_interview_task_1/components/avatar.dart';
import 'package:fe_interview_task_1/components/option_component.dart';
import 'package:flutter/material.dart';

class MyBottomSection extends StatelessWidget {
  const MyBottomSection({super.key});
  final String name = 'Angelina';
  final num age = 28;
  final String question = 'What is your favorite time of the day?';
  final String quote = '“Mine is definitely the peace in the morning.”';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 27,
          ),
          const MyAvatar(imagePath: 'lib/assets/human.png'),
          const SizedBox(
            width: 4,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  style: const TextStyle(
                      color: Color(0xFFF5F5F5),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'ProximaNova'),
                  '$name , ${age.toString()}'),
              Text(
                question,
                style: const TextStyle(
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ],
          )),
          const SizedBox(
            width: 32,
          )
        ],
      ),
      Text(
        quote,
        style: const TextStyle(
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color.fromRGBO(203, 201, 255, 0.70),
            fontStyle: FontStyle.italic),
      ),
    ]);
  }
}
