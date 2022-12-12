import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.habitCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: habitCompleted,
              onChanged: ((value) {}),
            ),
            Text(
              habitName,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
