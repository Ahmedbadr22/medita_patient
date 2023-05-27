import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'data.dart';

Random random = Random();

class EyeTestScreen extends StatefulWidget {
  const EyeTestScreen({super.key});

  @override
  State<EyeTestScreen> createState() => _EyeTestScreenState();
}

class _EyeTestScreenState extends State<EyeTestScreen> {
  int randomNumber = 0;
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    randomNumber = random.nextInt(imageModel[0].length - 1);
  }

  var text = "Speak now  . . . ";
  var theTrueWord = '';
  var isListening = false;
  double _confidence = 1;
  List<String> searchWords = ["تحت", "فوق", "شمال", "يمين"];

  bool isArrow = false;

  _listening() async {
    if (!isListening) {
      bool available = await _speechToText.initialize();
      if (available) {
        setState(() => isListening = true);
        _speechToText.listen(
            listenFor: const Duration(minutes: 1),
            onResult: (result) {
              setState(() {
                isListening = false;
                text = result.recognizedWords;
                checkWords(text, searchWords);
                if (result.hasConfidenceRating && result.confidence > 0) {
                  _confidence = result.confidence;
                }
              });
            });
      }
    } else {
      setState(() {
        isListening = false;
      });
      _speechToText.stop();
    }
  }

  checkWords(String text, List<String> searchWords) {
    setState(() {
      for (int i = 0; i < searchWords.length; i++) {
        setState(() {
          if (text.contains(searchWords[i])) {
            setState(() {
              _voiceValidation(i);
              theTrueWord = searchWords[i];
            });
          } else {
            _listening();
          }
        });
      }
    });
  }

  int currentLevel = 0;

  int trueCount = 0;
  int falseCount = 0;
  void _listValidation(int direction) {
    if (direction == randomNumber) {
      trueCount++;
      print('trueCount: $trueCount');
    } else if (direction != randomNumber) {
      falseCount++;
      print('falseCount: $falseCount');
    }
    generateRandomNumber();

    if (trueCount == 4) {
      falseCount = 0;
      currentLevel++;
      trueCount = 0;
    } else if (falseCount == 2) {
      _showMyDialog('ok');
    }
    if (currentLevel > 8) {
      currentLevel = 8;
      _showMyDialog('ok');
    }
  }

  void _voiceValidation(int index) {
    if (index == randomNumber) {
      trueCount++;
      print('trueCount: $trueCount');
    } else if (index != randomNumber) {
      falseCount++;
      print('falseCount: $falseCount');
    }
    generateRandomNumber();

    if (trueCount == 4) {
      falseCount = 0;
      currentLevel++;
      trueCount = 0;
    } else if (falseCount == 2) {
      _showMyDialog('ok');
    }
    if (currentLevel > 8) {
      currentLevel = 8;
      _showMyDialog('ok');
    }
  }

  Future<void> _showMyDialog(String dialogButton, {String? wrong = ''}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Vision Result'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("$wrong"),
                Text('Your Current Level is: ${currentLevel + 1}'),
                Text(result[currentLevel == 0 ? 0 : currentLevel - 1])
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(dialogButton),
              onPressed: () {
                setState(() {
                  falseCount = 0;
                  trueCount = 0;
                  currentLevel = 0;
                  isListening = false;
                  _speechToText.stop();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int generateRandomNumber() {
    var ran = random.nextInt(imageModel[0].length);
    if (ran == randomNumber) {
      if (!isArrow) {
        setState(() {
          isListening = false;
          _listening();
        });
      }

      return generateRandomNumber();
    } else {
      if (!isArrow) {
        setState(() {
          isListening = false;
          _listening();
        });
      }
      randomNumber = ran;
      print('random num : $randomNumber');

      return randomNumber;
    }
  }

  List<bool> resultList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Eye Test'),
          actions: [restartButton()],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          endRadius: 75.0,
          animate: isListening,
          glowColor: ColorManager.lightBlue,
          repeat: true,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          showTwoGlows: true,
          child: FloatingActionButton(
            onPressed: () {
              _listening();
            },
            backgroundColor: ColorManager.lightBlue,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: ColorManager.white,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(230, 245, 255, 1),
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Color.fromRGBO(204, 235, 255, 1)
                ]),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(AppSize.s16),
              child: const Text(
                'Recognized words:',
                style: TextStyle(fontSize: AppSize.s20),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(AppSize.s16),
                child: Text(
                    // If listening is active show the recognized words
                    _speechToText.isListening
                        ? theTrueWord
                        : _speechEnabled
                            ? 'Tap the microphone to start listening...'
                            : 'Click on mic to speak',
                    style: const TextStyle(
                        color: ColorManager.lightBlue, fontSize: AppSize.s14))),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSize.s100),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Divider(),
                          arrowButton(direction: 1, icon: Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.all(AppSize.s14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                arrowButton(
                                    direction: 2, icon: Icons.arrow_back),
                                Image.asset(
                                  imageModel[currentLevel][randomNumber].img,
                                  height: imageModel[currentLevel][randomNumber]
                                      .size,
                                ),
                                arrowButton(
                                    direction: 3, icon: Icons.arrow_forward),
                              ],
                            ),
                          ),
                          arrowButton(direction: 0, icon: Icons.arrow_downward),
                          const Divider(),
                        ])))
          ]),
        ));
  }

  Widget restartButton() {
    return Container(
        width: 45,
        // decoration: BoxDecoration(
        //     color: ColorManager.lightBlue,
        //     borderRadius: BorderRadius.circular(AppSize.s10),
        //     shape: BoxShape.rectangle),
        child: IconButton(
            onPressed: () {
              setState(() {
                falseCount = 0;
                trueCount = 0;
                currentLevel = 0;
                isListening = false;
                _speechToText.stop();
              });
            },
            icon: Icon(Icons.refresh_rounded,
                //color: ColorManager.white,
                size: AppSize.s25)));
  }

  Widget arrowButton({required int direction, required IconData icon}) {
    return Container(
        width: 45,
        decoration: BoxDecoration(
            color: ColorManager.lightBlue,
            borderRadius: BorderRadius.circular(AppSize.s10),
            shape: BoxShape.rectangle),
        child: IconButton(
            onPressed: () {
              setState(() {
                isArrow = true;
                _listValidation(direction);
                isArrow = false;
                isListening = false;
                _speechToText.stop();
              });
            },
            icon: Icon(icon, color: ColorManager.white, size: AppSize.s25)));
  }
}
