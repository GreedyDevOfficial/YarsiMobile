import 'dart:async';

import 'package:flutter/material.dart';

typedef void TimeCallback(int val);

class CountdownTimer extends StatefulWidget {

  final TimeCallback callback;

  CountdownTimer( {Key? key, required this.callback}) : super(key: key);



  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late final Timer countdownTimer;
  Duration myDuration = Duration(minutes: 3);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());

  }

  void stopTimer() {
    if (mounted) {
      setState(() => countdownTimer.cancel());
    }
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 3));
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    if (mounted) {

      setState(() {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        //Callback Function for return seconds to parent widget
        widget.callback(seconds);
        if (seconds < 0) {
          countdownTimer.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Column(
      children: [
        Text(
          '$minutes:$seconds',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 35, letterSpacing: 10.0),
        ),
        if (int.parse(seconds) == 0)  Container(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 50.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black87,
                      textStyle: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'IRANSans')
                  ),
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text('ارسال مجدد کد'),
                )
            )
        )
      ],
    );
  }
}
