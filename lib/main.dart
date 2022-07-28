import 'package:flutter/material.dart';
//import 'question.dart ';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'cows cant go upstairs',
  //   'papi is the second child for his home',
  //   'ethiopia is going to be super rich in the near future'
  // ];
  // List<bool> answers = [false, true, true];

  // Question q1 = Question('cows cant go upstairs', false);
  // List<Question> questionBank = [
  //   Question('cows cant go upstairs', false),
  //   Question('papi is the second child for his home', true),
  //   Question('ethiopia is going to be super rich in the near future', true),
  // ];
  void checkAnswer(bool pickedAnswer) {
    bool? correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {});
    if (correctAnswer == pickedAnswer) {
      print('the user got it right');
      setState(() {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        quizBrain.nextQuestion();
      });
    } else {
      print('the user got it wrong');
      setState(() {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Color.fromARGB(255, 252, 11, 11),
          ),
        );
        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 220.0),
            child: Expanded(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 243, 65, 33), // Background Color
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text('true'),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 28, 52, 71), // Background Color
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text('False'),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
