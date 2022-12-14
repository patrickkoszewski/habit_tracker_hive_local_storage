import 'package:flutter/material.dart';
import 'package:habit_tracker_hive_local_storage/components/my_alert_box.dart';
import 'package:habit_tracker_hive_local_storage/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/habit_tile.dart';
import '../components/my_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box('Habit_Database');

  @override
  void initState() {
    //if there is no current habit list, then it is the 1st time ever opening the app
    //then create dafault data
    if (_myBox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultData();
    }
    //there already exists data, this is not the first time
    else {
      db.loadData();
    }

    //update the database
    db.upadateDatabase();

    super.initState();
  }

  //checkbox was tapped method

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
  }

  //create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    //show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter Habit Name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  //save new habit
  void saveNewHabit() {
    //create new habit to todays habit list
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    //clear textfield
    _newHabitNameController.clear(); //celar cache for typed in text
    //pop dialog box
    Navigator.of(context).pop();
  }

  //cancel new habit
  void cancelDialogBox() {
    //clear textfield
    _newHabitNameController.clear(); //celar cache for typed in text
    //pop dialog box
    Navigator.of(context).pop();
  }

  //open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  //save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
  }

  //delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewHabit,
      ),
      body: ListView.builder(
        itemCount: db.todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: db.todaysHabitList[index][0],
            habitCompleted: db.todaysHabitList[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
            settingsTapped: (context) => openHabitSettings(index),
            deleteTapped: (context) => deleteHabit(index),
          );
        },
      ),
    );
  }
}
