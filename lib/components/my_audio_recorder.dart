// ignore_for_file:avoid_print
import 'dart:async';

import 'package:fe_interview_task_1/components/recorder_ui.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

enum ButtonState {
  startRecord,
  stopRecord,
  play,
  pause,
}

class MyAudioRecorder extends StatefulWidget {
  const MyAudioRecorder({super.key});

  @override
  State<MyAudioRecorder> createState() => _MyAudioRecorderState();
}

class _MyAudioRecorderState extends State<MyAudioRecorder> {
  bool isRecorded = false;
  bool isUnmatched = true;
  late String filePath = '';
  late AudioRecorder recorder = AudioRecorder();
  late AudioPlayer player = AudioPlayer();
  // permissions:
  Permission microphonePermission = Permission.microphone;
  Permission mediaPermission = Permission.mediaLibrary;
  Permission storagePermission = Permission.storage;
  // ui things:
  bool areDeleteSubmitButtonEnabled = false;
  // String buttonState = 'start_record_button';
  ButtonState buttonState = ButtonState.startRecord;
  late StreamSubscription<Duration?> durationSubscription;
  String totalDuration = "0:00";
  List<Amplitude?> amplitudes = [];

  @override
  void initState() {
    super.initState();
    recorder = AudioRecorder();
    player = AudioPlayer();
    initAudioPlayer();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  Future<void> initAudioPlayer() async {
    try {
      durationSubscription = player.durationStream.listen((duration) {
        if (duration != null) {
          setState(() {
            totalDuration = _formatDuration(duration);
          });
        }
      });
    } catch (e) {
      print("Error initializing audio player: $e");
    }
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

      Timer.periodic(const Duration(milliseconds: 450), (timer) async {
        if (await recorder.isRecording()) {
          Amplitude amplitude = await recorder.getAmplitude();
          print("\n amplitude rn is $amplitude");
          setState(() {
            amplitudes.add(amplitude);
          });
        } else {
          timer.cancel();
        }
      });
    } catch (e) {
      print(e);

      print(filePath);
    }
  }

  Future<void> stopRecording() async {
    if (buttonState == ButtonState.stopRecord) {
      try {
        await recorder.stop();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> playRecording() async {
    try {
      await player.setLoopMode(LoopMode.one);
      await player.setFilePath(filePath);
      await player.play();
    } catch (e) {
      print('\n\nCould not play \n');
      print(e);
      print('\n\n error message above \n');
    }
  }

  Future<void> pauseRecording() async {
    await player.pause();
  }

  Future<void> deleteSubmitRecording() async {
    await player.stop();
    await recorder.stop();
    setState(() {
      totalDuration = '00:00';
    });
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
        setState(() {
          amplitudes = [];
        });
        if ((buttonState == ButtonState.play ||
                buttonState == ButtonState.pause) &&
            !isRecorded) {
          buttonState = ButtonState.startRecord;
        }
      }
    });
  }

  void toggleButton() {
    print(buttonState);
    print(buttonState.name);
    setState(() {
      if (buttonState == ButtonState.startRecord) {
        startRecording();
        buttonState = ButtonState.stopRecord;
        isUnmatched = false;
      } else if (buttonState == ButtonState.stopRecord) {
        stopRecording();
        isRecorded = true;
        isUnmatched = true;
        areDeleteSubmitButtonEnabled = true;
        buttonState = ButtonState.play;
      } else if (buttonState == ButtonState.play && isRecorded) {
        buttonState = ButtonState.pause;
        isUnmatched = true;
        playRecording();
      } else if (buttonState == ButtonState.pause && isRecorded) {
        buttonState = ButtonState.play;
        isUnmatched = true;
        pauseRecording();
      } else if ((buttonState == ButtonState.play ||
              buttonState == ButtonState.pause) &&
          !isRecorded) {
        buttonState = ButtonState.startRecord;
        isUnmatched = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyRecorder(
      toggleButton: toggleButton,
      totalDuration: totalDuration,
      submitDeletePressed: submitDeletePressed,
      amplitudes: amplitudes,
      isRecorded: isRecorded,
      isUnmatched: isUnmatched,
      areDeleteSubmitButtonEnabled: areDeleteSubmitButtonEnabled,
      buttonState: buttonState,
    );
  }
}
