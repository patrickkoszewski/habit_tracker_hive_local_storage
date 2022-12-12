import 'package:flutter/material.dart';

import '../components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool to control habit completed
  bool habitCompleted = false;

  //checkbox was tapped method

  void checkBoxTapped(bool? value) {
    setState(() {
      habitCompleted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView(
          children: [
            //habit tiles
            HabitTile(
              habitName: 'Nauka Fluttera',
              habitCompleted: habitCompleted,
              onChanged: (value) => checkBoxTapped(value),
            ),
          ],
        ));
  }
}
