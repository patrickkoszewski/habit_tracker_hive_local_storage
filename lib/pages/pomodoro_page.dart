import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_hive_local_storage/pages/cubit/pomodoro_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:habit_tracker_hive_local_storage/model/pomodoro_status.dart';
import 'package:habit_tracker_hive_local_storage/utils/pomodoro_constants.dart';
import 'package:habit_tracker_hive_local_storage/widget/pomodoro_progress_icons.dart';
import 'package:habit_tracker_hive_local_storage/widget/pomodoro_custom_button.dart';
import 'cubit/pomodoro_cubit.dart';
//import 'cubit/pomodoro_state.dart';

class PomodoroPage extends StatelessWidget {
  // final AudioCache _player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Center(child: Text('Title'))),
      backgroundColor: Colors.grey[700],
      body: SafeArea(
          child: BlocProvider(
        create: (context) => PomodoroCubit(),
        child: BlocListener<PomodoroCubit, PomodoroState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<PomodoroCubit, PomodoroState>(
            builder: (context, state) {
              final pomodoroCubit = BlocProvider.of<PomodoroCubit>(context);
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pomodoro number: ${pomodoroCubit.pomodoroNum}',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Set: ',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CircularPercentIndicator(
                          radius: 140.0,
                          lineWidth: 15.0,
                          percent: pomodoroCubit._getPomodoroPercentage(),
                          //zaookrąglenie wewnąrz indikatora
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            pomodoroCubit._secondsToFormatedString(
                                pomodoroCubit.remainingTime),
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          progressColor:
                              statusColor[pomodoroCubit.pomodoroStatus],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ProgressIcons(
                          total: pomodoroPerSet,
                          done: pomodoroCubit.pomodoroNum -
                              (pomodoroCubit.setNum * pomodoroPerSet),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          statusDescription[pomodoroCubit.pomodoroStatus]!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: PomodoroCustomButton(
                            onTap: pomodoroCubit._mainButtonPressed,
                            text: pomodoroCubit.mainBtnText,
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: PomodoroCustomButton(
                            onTap: pomodoroCubit._resetButtonPressed,
                            text: pomodoroCubit._btnTextReset,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}

// const _btnTextStart = 'START POMODORO';
// const _btnTextResumePomodoro = 'RESUME POMODORO';
// const _btnTextResumeBreak = 'RESUME BREAK';
// const _btnTextStartShortBreak = 'TAKE SHORT BREAK';
// const _btnTextStartLongBreak = 'TAKE LONG BREAK';
// const _btnTextStartNewSet = 'START NEW SET';
// const _btnTextPause = 'PAUSE';
// const _btnTextReset = 'RESET';

// //Method to convert sec to min
//   _secondsToFormatedString(int seconds) {
//     // ~ - rounded
//     int roundedMinutes = seconds ~/ 60;
//     int remainingSeconds = seconds - (roundedMinutes * 60);
//     String remainingSecondsFormated;

//     if (remainingSeconds < 10) {
//       remainingSecondsFormated = '0$remainingSeconds';
//     } else {
//       remainingSecondsFormated = remainingSeconds.toString();
//     }

//     return '$roundedMinutes:$remainingSecondsFormated';
//   }

// // Method
//   _getPomodoroPercentage() {
//     int totalTime;
//     switch (pomodoroStatus) {
//       case PomodoroStatus.runingPomodoro:
//         totalTime = pomodoroTotalTime;
//         break;
//       case PomodoroStatus.pausedPomodoro:
//         totalTime = pomodoroTotalTime;
//         break;
//       case PomodoroStatus.runningShortBreak:
//         totalTime = shortBreakTime;
//         break;
//       case PomodoroStatus.pausedShortBreak:
//         totalTime = shortBreakTime;
//         break;
//       case PomodoroStatus.runningLongBreak:
//         totalTime = longBreakTime;
//         break;
//       case PomodoroStatus.pausedLongBreak:
//         totalTime = longBreakTime;
//         break;
//       case PomodoroStatus.setFinished:
//         totalTime = pomodoroTotalTime;
//         break;
//     }

//     double percentage = (totalTime - remainingTime) / totalTime;
//     return percentage;
//   }

// // Method for onTap<MainButton> //jaki tekst ma się wyświetlać
//   _mainButtonPressed() {
//     switch (pomodoroStatus) {
//       case PomodoroStatus.pausedPomodoro:
//         _startPomodoroCountdown();
//         break;
//       case PomodoroStatus.runingPomodoro:
//         _pausePomodoroCountdown();
//         break;
//       case PomodoroStatus.runningShortBreak:
//         _pauseShortBreakCountdown();
//         break;
//       case PomodoroStatus.pausedShortBreak:
//         _startShortBreak();
//         break;
//       case PomodoroStatus.runningLongBreak:
//         _pauseLongBreakCountdown();
//         break;
//       case PomodoroStatus.pausedLongBreak:
//         _startLongBreak();
//         break;
//       case PomodoroStatus.setFinished:
//         setNum++;
//         _startPomodoroCountdown();
//         break;
//     }
//   }

//   //here 1 state changes only once not every second
//   _startShortBreak() {
//     pomodoroStatus = PomodoroStatus.runningShortBreak;
//     setState(() {
//       mainBtnText = _btnTextPause;
//     });
//     _cancelTimer();
//     _timer = Timer.periodic(
//         const Duration(seconds: 1),
//         (timer) => {
//               if (remainingTime > 0)
//                 {
//                   setState(() {
//                     remainingTime--;
//                   }),
//                 }
//               else
//                 {
//                   // we finished short break it should ask user to start new pomodoro
//                   _playSound(),
//                   remainingTime = pomodoroTotalTime,
//                   _cancelTimer(),
//                   pomodoroStatus = PomodoroStatus.pausedPomodoro,
//                   setState(() {
//                     mainBtnText = _btnTextStart;
//                   }),
//                 }
//             });
//   }

//   _startLongBreak() {
//     pomodoroStatus = PomodoroStatus.runningLongBreak;
//     setState(() {
//       mainBtnText = _btnTextPause;
//     });
//     _cancelTimer();
//     _timer = Timer.periodic(
//         const Duration(seconds: 1),
//         (timer) => {
//               if (remainingTime > 0)
//                 {
//                   setState(() {
//                     remainingTime--;
//                   }),
//                 }
//               else
//                 {
//                   // we finished long break it should ask user to start new pomodoro
//                   _playSound(),
//                   remainingTime = pomodoroTotalTime,
//                   _cancelTimer(),
//                   pomodoroStatus = PomodoroStatus.setFinished,
//                   setState(() {
//                     mainBtnText = _btnTextStartNewSet;
//                   }),
//                 }
//             });
//   }

//   _startPomodoroCountdown() {
//     pomodoroStatus = PomodoroStatus.runingPomodoro;
//     _cancelTimer();

//     _timer = Timer.periodic(
//         const Duration(seconds: 1),
//         (timer) => {
//               if (remainingTime > 0)
//                 {
//                   setState(() {
//                     remainingTime--;
//                     mainBtnText = _btnTextPause;
//                   })
//                 }
//               else
//                 {
//                   _playSound(),
//                   pomodoroNum++,
//                   _cancelTimer(),
//                   if (pomodoroNum % pomodoroPerSet == 0)
//                     {
//                       pomodoroStatus = PomodoroStatus.pausedLongBreak,
//                       setState(() {
//                         remainingTime = longBreakTime;
//                         mainBtnText = _btnTextStartLongBreak;
//                       }),
//                     }
//                   else
//                     {
//                       pomodoroStatus = PomodoroStatus.pausedShortBreak,
//                       setState(() {
//                         remainingTime = shortBreakTime;
//                         mainBtnText = _btnTextStartShortBreak;
//                       }),
//                     }
//                 }
//             });
//   }

//   _pausePomodoroCountdown() {
//     pomodoroStatus = PomodoroStatus.pausedPomodoro;
//     _cancelTimer();
//     setState(() {
//       mainBtnText = _btnTextResumePomodoro;
//     });
//   }

//   _resetButtonPressed() {
//     pomodoroNum = 0;
//     setNum = 0;
//     _cancelTimer();
//     _stopCountdown();
//   }

//   _stopCountdown() {
//     pomodoroStatus = PomodoroStatus.pausedPomodoro;
//     setState(() {
//       mainBtnText = _btnTextStart;
//       remainingTime = pomodoroTotalTime;
//     });
//   }

//   // break 5 min // long break 15 min
//   _pauseShortBreakCountdown() {
//     pomodoroStatus = PomodoroStatus.pausedShortBreak;
//     _pauseBreakCountdown();
//   }

//   _pauseLongBreakCountdown() {
//     pomodoroStatus = PomodoroStatus.pausedLongBreak;
//     _pauseBreakCountdown();
//   }

//   _pauseBreakCountdown() {
//     _cancelTimer();

//     mainBtnText = _btnTextResumeBreak;
//   }

//   _cancelTimer() {
//     if (_timer != null) {
//       _timer.cancel();
//     }
//   }

//   _playSound() {
//     player.play(AssetSource('tomato.mp3'));
//   }
// }
