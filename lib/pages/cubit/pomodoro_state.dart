part of 'pomodoro_cubit.dart';

enum PomodoroStatus {
  runingPomodoro,
  pausedPomodoro,
  runningShortBreak,
  pausedShortBreak,
  runningLongBreak,
  pausedLongBreak,
  setFinished
}

const _btnTextStart = 'START POMODORO';
const _btnTextResumePomodoro = 'RESUME POMODORO';
const _btnTextResumeBreak = 'RESUME BREAK';
const _btnTextStartShortBreak = 'TAKE SHORT BREAK';
const _btnTextStartLongBreak = 'TAKE LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextPause = 'PAUSE';
const _btnTextReset = 'RESET';

class PomodoroState with ChangeNotifier {
  late Timer _timer;
  int pomodoroTotalTime = 25 * 60;
  int remainingTime = 0;
  double _pomodoroPercentage = 0.0;
  bool isActive = false;

  double get pomodoroPercentage => _pomodoroPercentage;

  set pomodoroPercentage(double value) {
    _pomodoroPercentage = value;
    notifyListeners();
  }

  String _secondsToFormatedString(int time) {
    final int minutes = (time / 60).floor();
    final int seconds = time - minutes * 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String get timerString {
    return _secondsToFormatedString(remainingTime);
  }

  double _getPomodoroPercentage() => remainingTime / pomodoroTotalTime * 1.0;

  void cancelTimer() {
    isActive = false;
    _timer.cancel();
  }

  void startTimer() {
    isActive = true;
    remainingTime = pomodoroTotalTime;
    pomodoroPercentage = _getPomodoroPercentage();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Code to be executed every second
      remainingTime--;
      pomodoroPercentage = _getPomodoroPercentage();
      if (remainingTime == 0) {
        isActive = false;
        cancelTimer();
      }
      notifyListeners();
    });
  }

  void reset() {
    cancelTimer();
    remainingTime = 0;
    pomodoroPercentage = 0.0;
  }
}
