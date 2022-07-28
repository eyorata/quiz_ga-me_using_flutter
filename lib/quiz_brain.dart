import 'question.dart';

class QuizBrain {
  int _num = 0;
  List<Question> _questionBank = [
    Question('cows cant go upstairs', false),
    Question('papi is the second child for his home', true),
    Question('ethiopia is going to be super rich in the near future', true),
  ];
  void nextQuestion() {
    if (_num < _questionBank.length - 1) {
      _num++;
    }
  }

  String getQuestionText() {
    return _questionBank[_num].questionText!;
  }

  bool getQuestionAnswer() {
    return _questionBank[_num].questionAnswer!;
  }
}
