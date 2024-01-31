import 'package:fe_interview_task_1/assets/my_icons.dart';
import 'package:fe_interview_task_1/components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:record/record.dart';

class MyRecorder extends StatelessWidget {
  final String totalDuration;
  final bool isUnmatched, isRecorded, areDeleteSubmitButtonEnabled;
  final Function submitDeletePressed, toggleButton;
  final Enum buttonState;
  final List<Amplitude?> amplitudes;

  const MyRecorder({
    super.key,
    required this.totalDuration,
    required this.isUnmatched,
    required this.submitDeletePressed,
    required this.isRecorded,
    required this.buttonState,
    required this.areDeleteSubmitButtonEnabled,
    required this.toggleButton,
    required this.amplitudes,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Column(
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
              child: MyAvatar(imagePath: myIcons[MyIcon.human]!),
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
                child: Column(children: [
                  const Padding(
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
                  const Text(
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
                      padding: const EdgeInsets.only(
                        top: 34,
                      ),
                      child: Text(
                        totalDuration.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(245, 245, 245, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'ProximaNova',
                        ),
                      )),
                ])),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // straight line indicating there is no recording
                      // nor anything is being recorded currently
                      if (isUnmatched && !isRecorded)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          child: Container(
                            color: const Color.fromRGBO(54, 57, 62, 1),
                            height: 2,
                            width: MediaQuery.of(context).size.width - 20,
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // should not be rendered if there is no audio recording but should
                          // if an audio is BEING recorded hence using isUnmatched
                          if (!isUnmatched || isRecorded)
                            for (var i in amplitudes)
                              Container(
                                width: 2,
                                height: (i!.max - i.current) * -1 / 4,
                                margin:
                                    const EdgeInsets.only(bottom: 10, right: 2),
                                decoration: BoxDecoration(
                                  color: !isRecorded
                                      ? const Color.fromRGBO(54, 57, 62, 0.95)
                                      : const Color.fromRGBO(191, 189, 255, 1),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                        ],
                      ),
                    ]),
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
                  // the enum state IS used as the button name hence the following:
                  icon: SvgPicture.asset(
                      'lib/assets/icons/${buttonState.name.toString()}.svg'),
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
            const SizedBox(
              height: 22,
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
        ));
  }
}
