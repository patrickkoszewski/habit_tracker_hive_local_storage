import 'package:flutter/material.dart';

import '../components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView(
          children: [
            //habit tiles
            HabitTile(
              habitName: 'Nauka Fluttera',
              habitCompleted: false,
            ),
          ],
        ));
  }
}
