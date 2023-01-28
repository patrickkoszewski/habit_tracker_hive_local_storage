import 'package:flutter/material.dart';
import 'package:habit_tracker_hive_local_storage/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox('Habit_Database'); //name of database

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
