import 'package:flutter/material.dart';

class HabitGuidePage extends StatelessWidget {
  const HabitGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
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
              'Codzienne pracowanie nad dobrymi nawykami może przynieść wiele korzyści, takich jak: Poprawa samodyscypliny i motywacji, co może przełożyć się na lepsze wyniki w pracy i nauce Poprawa zdrowia fizycznego i psychicznego, dzięki nawykom związanym z aktywnością fizyczną, dietą, senem itp. Zwiększenie produktywności i efektywności, dzięki nawykom takim jak planowanie, organizacja czasu itp. Poprawa jakości życia, dzięki nawykom takim jak medytacja, wdzięczność itp.',
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
