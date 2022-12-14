import 'package:habit_tracker_hive_local_storage/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

//reference our box
final _myBox = Hive.box('Habit_Database');

class HabitDatabase {
  List todaysHabitList = [];

  //create initial default data
  void createDefaultData() {
    todaysHabitList = [
      ['Bieganie', false],
      ['Kodowanie', false],
    ];

    _myBox.put('START_DATE', todaysDateFormatted());
  }

  //load data if it already exists
  void loadData() {
    //if it's a new day, get habit list from database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get('CuRRENT_HABIT_LIST');
      //set all habits completed to false since it's a new day
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    }

    //if it's not a new day, load todays list
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  //update database
  void upadateDatabase() {}
}
