import 'package:hive_flutter/hive_flutter.dart';

//reference our box
final _myBox = Hive.box('Habit_Database');

class HabitDatabase {
  List todaysHabitList = [];

  //create initial default data
  void createDefaultData() {}

  //load data if it already exists
  void loadData() {}
  //update database
  void upadateDatabase() {}
}
