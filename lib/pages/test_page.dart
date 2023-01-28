import 'package:flutter/material.dart';
import 'package:habit_tracker_hive_local_storage/components/month_summary.dart';
import 'package:habit_tracker_hive_local_storage/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HeatMapPage extends StatefulWidget {
  const HeatMapPage({super.key});

  @override
  State<HeatMapPage> createState() => _HeatMapPageState();
}

class _HeatMapPageState extends State<HeatMapPage> {
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
    db.upadateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: Text(
                  'Keep track of your progress with heat map',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
            Expanded(
              child: MonthlySummary(
                  datasets: db.heatMapDataSet,
                  startDate: _myBox.get('START_DATE')),
            ),
          ],
        ),
      ),
    );
  }
}
