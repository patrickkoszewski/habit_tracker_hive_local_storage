import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  //variables
  int timeLeft = 5;

  // timer method
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        // jeżeli timeLeft jest większy od 0 wykonuj --
        setState(() {
          //change values
          timeLeft--; // to samo co timeLeft = timeLeft - 1;
        });
      } else {
        // jeżeli timeLeft nie jest większe od 0 przestań wykonywać polecenie
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              //jeżeli timeLeft == 0 to wyświetl DONE
              //w innym wypadku pokaż ile czasu zostało
              timeLeft == 0 ? 'DONE' : timeLeft.toString(),
              style: const TextStyle(
                fontSize: 70,
              ),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              color: Colors.deepPurple,
              child: const Text(
                'S T A R T',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
