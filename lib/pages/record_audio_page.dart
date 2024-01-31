import 'package:fe_interview_task_1/assets/my_icons.dart';
import 'package:fe_interview_task_1/components/my_audio_recorder.dart';
import 'package:fe_interview_task_1/components/my_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioRecordingPage extends StatelessWidget {
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
          Positioned(
            left: -39,
            width: 476,
            height: 605,
            child: Image.asset(
              myIcons[MyIcon.human]!,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              myIcons[MyIcon.recordFadeOver]!,
              fit: BoxFit.cover,
            ),
          ),
          const MyStatusBar(
            name: "Angelina",
            age: 28,
          ),
          MyAudioRecorder(
            key: key,
          )
        ],
      ),
    ));
  }
}
