import 'package:fe_interview_task_1/components/avatar.dart';
import 'package:fe_interview_task_1/components/option_component.dart';
import 'package:fe_interview_task_1/pages/record_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomSection extends StatelessWidget {
  MyBottomSection({super.key});
  final String name = 'Angelina';
  final num age = 28;
  final String question = 'What is your favorite time of the day?';
  final String quote = '“Mine is definitely the peace in the morning.”';

  final List<String> choices = [
    'The peace in the early mornings',
    'The magical golden hours',
    'Wind-down time after dinners',
    'The serenity past midnight'
  ];
  final List<String> options = ['A', 'B', 'C', 'D'];
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
      Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOptionComponent(
                choice: choices[0],
                option: options[0],
                onPressed: () {},
                selected: false,
              ),
              const SizedBox(
                width: 12,
              ),
              MyOptionComponent(
                choice: choices[1],
                option: options[1],
                onPressed: () {},
                selected: false,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOptionComponent(
                choice: choices[2],
                option: options[2],
                onPressed: () {},
                selected: false,
              ),
              const SizedBox(
                width: 12,
              ),
              MyOptionComponent(
                choice: choices[3],
                option: options[3],
                onPressed: () {},
                selected: true,
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pick your option.\nSee who has a similar mind.',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromRGBO(203, 201, 255, 0.70),
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AudioRecordingPage()));
                      },
                      child: SvgPicture.asset('lib/assets/mike.svg'),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('lib/assets/arrow.svg'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
