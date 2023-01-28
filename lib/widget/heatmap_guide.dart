import 'package:flutter/material.dart';

class HeatMapGuidePage extends StatelessWidget {
  const HeatMapGuidePage({super.key});

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
              'Co to jest HeatMap?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Heatmap to narzędzie wizualizacji danych, które pomaga śledzić i analizować nawyki przez pokazywanie ich w postaci kolorowej mapy. Kolory oznaczają poziom zaangażowania lub częstotliwość wykonywania nawyku. Heatmapy pozwalają na łatwe i szybkie zauważenie wzorców i tendencji, co ułatwia dostosowanie działań do celów.',
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
