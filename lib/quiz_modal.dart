import 'package:flutter/material.dart';

class QuizQuestion {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

class UserScore {
  int score = 1;
}

class UserScoreProvider with ChangeNotifier {
  final UserScore _userScore = UserScore();

  UserScore get userScore => _userScore;

  void incrementScore() {
    _userScore.score++;
    notifyListeners();
  }

  void resetScore() {
    _userScore.score = 0;
    notifyListeners();
  }
}
