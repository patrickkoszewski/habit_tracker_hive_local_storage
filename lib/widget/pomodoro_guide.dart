import 'package:flutter/material.dart';

class PomodoroGuidePage extends StatelessWidget {
  const PomodoroGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        height: 500,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Co to jest to Pomodoro?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Technika Pomodoro to metoda zarządzania czasem, która polega na dzieleniu pracy na krótkie interwały (zwykle 25 minut), zwane "pomodorami", poprzedzone krótką przerwą (5 minut). Po czterech lub pięciu pomodorach, przerwa jest dłuższa (15-30 minut). Celem tej techniki jest zwiększenie skuteczności i produktywności poprzez redukcję rozpraszających myśli i zwiększenie motywacji do pracy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Rozumiem',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
