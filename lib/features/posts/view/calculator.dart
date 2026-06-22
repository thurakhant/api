import 'package:api/features/posts/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    double number = context.watch<CalculatorController>().total;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                context.read<CalculatorController>().plus();
              },
              label: Icon(Icons.plus_one),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<CalculatorController>().twoX();
                  },
                  label: Icon(Icons.multiple_stop_sharp),
                ),
                Text('$number', style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold)),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<CalculatorController>().dividedWithTwo();
                  },
                  label: Icon(Icons.exposure_minus_1_outlined),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CalculatorController>().minus();
              },
              label: Icon(Icons.exposure_minus_1_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
