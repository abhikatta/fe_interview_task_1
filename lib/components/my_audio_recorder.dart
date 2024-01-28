// ignore_for_file: avoid_print

import 'package:fe_interview_task_1/components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class MyAudioRecorder extends StatefulWidget {
  const MyAudioRecorder({super.key});

  @override
  State<MyAudioRecorder> createState() => _MyAudioRecorderState();
}

class _MyAudioRecorderState extends State<MyAudioRecorder> {
  bool areDeleteSubmitButtonEnabled = false;
  String buttonState = 'start_record_button';
  bool isRecorded = false;
  bool isUnmatched = true;
  late String filePath = '';
  late AudioRecorder recorder = AudioRecorder();
  late AudioPlayer player = AudioPlayer();
  Permission microphonePermission = Permission.microphone;
  Permission mediaPermission = Permission.mediaLibrary;
  Permission storagePermission = Permission.storage;

  @override
  void initState() {
    super.initState();
    recorder = AudioRecorder();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    recorder.dispose();
    player.dispose();
  }

  Future<void> startRecording() async {
    try {
      await mediaPermission.request();
      await microphonePermission.request();
      await storagePermission.request();
      String tempDir = (await getTemporaryDirectory()).path;
      filePath = '$tempDir/temp_recording.m4a';

      await recorder.start(const RecordConfig(), path: filePath);
      // await recorder.getAmplitude();
    } catch (e) {
      print(e);

      print(filePath);
    }
  }

  Future<void> stopRecording() async {
    if (buttonState == 'stop_record_button') {
      try {
        print(await recorder.stop());
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> playRecording() async {
    try {
      await player.setFilePath(filePath);
      await player.play();
      // await player.setFilePath(filePath, preload: false);
    } catch (e) {
      print('\n\nCould not play \n');
      print(e);
      print('\n\n error message above \n');
    }
  }

  Future<void> pauseRecording() async {
    // await player.setAsset('lib/assets/music.mp3');
    await player.pause();
  }

  Future<void> deleteSubmitRecording() async {
    await player.stop();

    print('Deleted recording');
  }

/*
all states: none, recording, recorded, playable, playing, 

while ::
  none->recordable
  recorded->playable
  playable->pausible
  pausible->playable

initially : 
button state: idle (none)
first press: isRecording=true
second press on isRecording :: true : isRecorded=true

presses available on isRecorded=true: play, delete, submit 
current button :: isPlayable

while playable : new button state:: isPausable=true
if not playing : button state::isPausable=false

*/

  void submitDeletePressed() {
    setState(() {
      if (areDeleteSubmitButtonEnabled) {
        isRecorded = false;
        areDeleteSubmitButtonEnabled = false;
        deleteSubmitRecording();
        if ((buttonState == 'play_button' || buttonState == 'pause_button') &&
            !isRecorded) {
          buttonState = 'start_record_button';
        }
      }
    });
  }

  void toggleButton() {
    setState(() {
      if (buttonState == 'start_record_button') {
        startRecording();
        buttonState = 'stop_record_button';
        isUnmatched = false;
      } else if (buttonState == 'stop_record_button') {
        stopRecording();
        isRecorded = true;
        isUnmatched = true;
        areDeleteSubmitButtonEnabled = true;
        buttonState = 'play_button';
      } else if (buttonState == 'play_button' && isRecorded) {
        buttonState = 'pause_button';
        isUnmatched = true;
        playRecording();
      } else if (buttonState == 'pause_button' && isRecorded) {
        buttonState = 'play_button';
        isUnmatched = true;
        pauseRecording();
      } else if ((buttonState == 'play_button' ||
              buttonState == 'pause_button') &&
          !isRecorded) {
        buttonState = 'start_record_button';
        isUnmatched = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.76,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const MyAvatar(imagePath: 'lib/assets/human.png'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: const Border.symmetric(
                horizontal: BorderSide(
                  width: 3.5,
                  color: Colors.black,
                ),
                vertical: BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
              ),
            ),
            child: const Text(
              'Stroll Question',
              style: TextStyle(
                fontSize: 11,
                backgroundColor: Colors.black,
                color: Color(0xFFF5F5F5),
                fontWeight: FontWeight.w700,
                fontFamily: 'ProximaNova',
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: const Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 55),
                    child: Text(
                      'What is your favorite time of the day?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFF5F5F5),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ProximaNova',
                      ),
                    )),
                Text(
                  '“Mine is definitely the peace in the morning.”',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(203, 201, 255, 0.7),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'ProximaNova',
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 34,
                    ),
                    child: Text(
                      '00:15 / 00:38',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(245, 245, 245, 1),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'ProximaNova',
                      ),
                    )),

                // temp:

                //
              ])),
          const Text(
            'Waveform here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFFF5F5F5),
              fontWeight: FontWeight.w700,
              fontFamily: 'ProximaNova',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  submitDeletePressed();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: areDeleteSubmitButtonEnabled == false
                        ? const Color.fromRGBO(255, 255, 255, 0.3)
                        : const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 13,
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 36),
              IconButton(
                onPressed: () {
                  toggleButton();
                },
                icon: SvgPicture.asset('lib/assets/$buttonState.svg'),
              ),
              const SizedBox(width: 36),
              TextButton(
                onPressed: () {
                  submitDeletePressed();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: areDeleteSubmitButtonEnabled == false
                        ? const Color.fromRGBO(255, 255, 255, 0.3)
                        : const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 13,
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Unmatch',
            style: TextStyle(
              color: isUnmatched == true
                  ? const Color.fromRGBO(255, 41, 41, 1)
                  : const Color.fromRGBO(190, 32, 32, 1),
              fontSize: 13,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
