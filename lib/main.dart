import 'package:flutter/material.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:moalemy/quiz_screen.dart';

void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}
