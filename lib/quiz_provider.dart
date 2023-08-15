import 'package:flutter/material.dart';

import 'package:quiz_project/quiz_modal.dart';

class QuizProvider with ChangeNotifier {
  final List<QuizQuestion> _flutterQuestions = [
    // Define Flutter quiz questions...
    QuizQuestion(
      questionText:
          'What programming language is used for Flutter development?',
      options: ['Dart', 'Java', 'Python', 'Swift'],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      questionText:
          'What widget is used to build the user interface in Flutter?',
      options: ['Scaffold', 'Container', 'Layout', 'UIBuilder'],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      questionText:
          'Which package is commonly used for state management in Flutter?',
      options: ['Provider', 'Redux', 'MobX', 'BLoC'],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      questionText: 'What is the purpose of a StatefulWidget in Flutter?',
      options: [
        'To define the layout of the app',
        'To manage the app\'s state',
        'To handle user input',
        'To create animations'
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      questionText: 'Which company developed Flutter?',
      options: ['Facebook', 'Google', 'Apple', 'Microsoft'],
      correctOptionIndex: 1,
    ),
  ];

  final List<QuizQuestion> _htmlQuestions = [
    // Define HTML quiz questions...
    QuizQuestion(
      questionText: 'What does HTML stand for?',
      options: [
        'HyperText Markup Language',
        'High-Level Text Management Language',
        'Home Tool Markup Language',
        'Hyperlink and Text Markup Language'
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      questionText: 'Which tag is used to define a hyperlink in HTML?',
      options: ['<link>', '<a>', '<hyperlink>', '<url>'],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      questionText: 'What does the acronym CSS stand for?',
      options: [
        'Computer Style Sheets',
        'Cascading Style Sheets',
        'Creative Style Sheets',
        'Colorful Style Sheets'
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      questionText: 'Which HTML element is used to include JavaScript code?',
      options: ['<js>', '<javascript>', '<script>', '<java>'],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      questionText: 'Which of the following is NOT a valid HTML tag?',
      options: ['<header>', '<main>', '<content>', '<footer>'],
      correctOptionIndex: 2,
    ),
  ];

  int _currentQuestionIndex = 0;
  String _currentQuizType = '';
  int _selectedOptionIndex = -1; // Initialize to -1 (no option selected)

  void setQuizType(String type) {
    _currentQuizType = type;
    _currentQuestionIndex = 0;
    _selectedOptionIndex = -1; // Reset selected option index
    notifyListeners();
  }

  List<QuizQuestion> get currentQuestions {
    return _currentQuizType == 'flutter' ? _flutterQuestions : _htmlQuestions;
  }

  int get currentQuestionIndex => _currentQuestionIndex;
  int get selectedOptionIndex => _selectedOptionIndex;

  void nextQuestion() {
    if (_currentQuestionIndex <= currentQuestions.length - 1) {
      _currentQuestionIndex++;
      _selectedOptionIndex = -1; // Reset selected option index
      notifyListeners();
    } else {
      _currentQuestionIndex = currentQuestions.length; // Mark quiz as finished
    }
  }

  void setSelectedOptionIndex(int index) {
    _selectedOptionIndex = index;
    notifyListeners();
  }

  void resetSelectedOptionIndex() {
    _selectedOptionIndex = -1;
    notifyListeners();
  }

  // Other methods to handle quiz logic...
}
