import 'package:fe_interview_task_1/components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAudioRecorder extends StatefulWidget {
  const MyAudioRecorder({Key? key}) : super(key: key);

  @override
  State<MyAudioRecorder> createState() => _MyAudioRecorderState();
}

class _MyAudioRecorderState extends State<MyAudioRecorder> {
  bool areDeleteSubmitButtonEnabled = false;
  String buttonState = 'start_record_button';
  bool isRecorded = false;

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
        buttonState = 'stop_record_button';
      } else if (buttonState == 'stop_record_button') {
        isRecorded = true;
        areDeleteSubmitButtonEnabled = true;
        buttonState = 'play_button';
      } else if (buttonState == 'play_button' && isRecorded) {
        buttonState = 'pause_button';
      } else if (buttonState == 'pause_button' && isRecorded) {
        buttonState = 'play_button';
      } else if ((buttonState == 'play_button' ||
              buttonState == 'pause_button') &&
          !isRecorded) {
        buttonState = 'start_record_button';
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
                onPressed: () {
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
              color: areDeleteSubmitButtonEnabled == true
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
