import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main() {
  runApp(const FinancialGoal());
}

class FinancialGoal extends StatelessWidget {
  const FinancialGoal({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}


