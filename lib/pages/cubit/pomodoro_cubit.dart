import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_hive_local_storage/utils/pomodoro_constants.dart';
import 'package:meta/meta.dart';

part 'pomodoro_state.dart';

class PomodoroInitial extends PomodoroState {}

class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(PomodoroInitial());

  late int remainingTime;
  int pomodoroNum = 0;
  int setNum = 0;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  late Timer _timer;
  late AudioCache _player;
  late AudioPlayer player;

  PomodoroCubit.withRemainingTime({required this.remainingTime})
      : super(PomodoroInitial());

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Code to be executed every second
    });
  }

  void cancelTimer() {
    _timer.cancel();
  }

  void dispose() {
    cancelTimer();
    player.dispose();
    //_player.clearCache();
  }

  double _getPomodoroPercentage() {
    return (PomodoroStatus as PomodoroState)._getPomodoroPercentage();
  }
}
