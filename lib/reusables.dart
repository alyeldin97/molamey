import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';


CountDownController controller = CountDownController();

//ANSWER WIDGET
Widget buildAnswer({String answer}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Material(
      color: Colors.transparent,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color((0xFFDB7E66)),
        ),
        child: InkWell(
          onTap: () {
            print('haga');
          },
          child: Text(
            'عطشانة',
            style: TextStyle(
              fontFamily: 'Arabic',
                color: Colors.white,
            fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}


