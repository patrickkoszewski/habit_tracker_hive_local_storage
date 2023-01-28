import 'package:flutter/material.dart';
import 'package:habit_tracker_hive_local_storage/pages/habit_page.dart';
import 'package:habit_tracker_hive_local_storage/pages/pomodoro_page.dart';
import 'package:habit_tracker_hive_local_storage/pages/profile_page.dart';
import 'package:habit_tracker_hive_local_storage/pages/heat_map_page.dart';
import 'package:habit_tracker_hive_local_storage/widget/pomodoro_guide.dart';
// import 'package:habit_tracker_hive_local_storage/pages/timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PomodoroPage(),
    HabitPage(),
    HeatMapPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Own Your Habit\'s',
              style: TextStyle(color: Colors.grey[800]),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PomodoroGuidePage();
                  },
                );
              },
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const PomodoroGuidePage()),
              //   );
              // },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.grey[700],
                    child: const Icon(
                      Icons.question_mark,
                      size: 20,
                      color: Colors.yellow,
                    ),
                  )),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Pomodoro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'HeatMap',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.yellow,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.red[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
