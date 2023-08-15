import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/quiz_modal.dart';
import 'package:quiz_project/quiz_option_screen.dart';
import 'package:quiz_project/quiz_provider.dart';
import 'package:quiz_project/quiz_question_screen.dart';
import 'package:quiz_project/quiz_result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(create: (context) => UserScoreProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          hintColor: Colors.greenAccent,
          fontFamily: 'Roboto', // Set your desired font family
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const QuizOptionsScreen(),
          '/question': (context) => const QuizQuestionScreen(),
          '/result': (context) => const QuizResultScreen(),
        },
      ),
    );
  }
}
