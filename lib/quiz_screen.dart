import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:moalemy/question_model.dart';
import 'package:moalemy/reusables.dart';

List<QuestionModel> questions = [
  QuestionModel(
    question: "ما هو مؤنث عطشان؟ 0",
    answers: ['عطشي','عطشانة','عطشي','عطشي'],
    correctAnswerIndex: 0,
  ),
  QuestionModel(
    question: "ما هو مؤنث عطشان؟ 1",
    answers: ['عطشي','عطشانة','عطشي','عطشي'],
    correctAnswerIndex: 1,
  ),
  QuestionModel(
    question: "ما هو مؤنث عطشان؟ 2 ",
    answers: ['عطشي','عطشانة','عطشي','عطشي'],
    correctAnswerIndex: 2,
  ),
  QuestionModel(
    question: "ما هو مؤنث عطشان؟ 3",
    answers: ['عطشي','عطشانة','عطشي','عطشي'],
    correctAnswerIndex: 3,
  ),

];

class QuizScreen extends StatefulWidget {

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool correct = false;
  int currentIndex=0;
  QuestionModel question;


  @override
  Widget build(BuildContext context) {
    question=questions[currentIndex];
    CountDownController _controller = CountDownController();
    int duration = 3;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 675.1358,
            width: 354.7804,
            decoration: new BoxDecoration(
              color: Color(0xFF8C364E),
              borderRadius: BorderRadius.circular(37),
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: '1 ',style: TextStyle(
                                  fontFamily: 'English',
                                  fontSize: 33.0,
                                  color: Color(0xFFDB7E66),
                                  fontWeight: FontWeight.bold),),
                              TextSpan(text:'/',style: TextStyle(
                                  fontFamily: 'English',
                                  fontSize: 20.0,
                                  color: Color(0xFF592043),
                                  fontWeight: FontWeight.bold),),
                              TextSpan(text: ' 4',style: TextStyle(
                                  fontFamily: 'English',
                                  fontSize: 33.0,
                                  color: Color(0xFFDB7E66),
                                  fontWeight: FontWeight.bold),),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                      Container(
                        child: CircularCountDownTimer(
                          // Countdown duration in Seconds.
                          duration: duration,

                          // Countdown initial elapsed Duration in Seconds.
                          initialDuration: 0,

                          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                          controller: _controller,

                          // Width of the Countdown Widget.
                          width: MediaQuery.of(context).size.width / 4,

                          // Height of the Countdown Widget.
                          height: MediaQuery.of(context).size.height / 5,

                          // Ring Color for Countdown Widget.
                          ringColor: Color(0xFF8C364E),
                          // Ring Gradient for Countdown Widget.
                          ringGradient: null,

                          // Filling Color for Countdown Widget.
                          fillColor: Color(0xFF592043),

                          // Filling Gradient for Countdown Widget.
                          fillGradient: null,

                          // Background Color for Countdown Widget.
                          backgroundColor: Color(0xFF8C364E),

                          // Background Gradient for Countdown Widget.
                          backgroundGradient: null,

                          // Border Thickness of the Countdown Ring.
                          strokeWidth: 10.0,

                          // Begin and end contours with a flat edge and no extension.
                          strokeCap: StrokeCap.round,

                          // Text Style for Countdown Text.
                          textStyle: TextStyle(
                              fontFamily: 'English',

                              fontSize: 33.0,
                              color: Color(0xFFDB7E66),
                              fontWeight: FontWeight.bold),

                          // Format for the Countdown Text.
                          textFormat: CountdownTextFormat.S,

                          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                          isReverse: false,

                          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                          isReverseAnimation: false,

                          // Handles visibility of the Countdown Text.
                          isTimerTextShown: true,

                          // Handles the timer start.
                          autoStart: true,

                          // This Callback will execute when the Countdown Starts.
                          onStart: () {
                            // Here, do whatever you want
                            print('Countdown Started');
                          },

                          // This Callback will execute when the Countdown Ends.
                          onComplete: () {
                            // Here, do whatever you want
                            print('Countdown Ended');
                            setState(() {
                              if(currentIndex<questions.length)
                              currentIndex++;
                            });
                            _controller.start();


                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    question.question,
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Arabic',
                        color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                  Column(
                    children: questions.map((question){
                      return buildAnswer();
                    } ).toList(),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
