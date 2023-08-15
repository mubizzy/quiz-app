import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/quiz_provider.dart';

class QuizOptionsScreen extends StatelessWidget {
  const QuizOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Options')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Let's Go", style: TextStyle(fontSize: 30.0)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    quizProvider.setQuizType('flutter');
                    Navigator.pushNamed(context, '/question');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.greenAccent, // Set your desired button color
                  ),
                  child: const Text('Start Flutter Quiz'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    quizProvider.setQuizType('html');
                    Navigator.pushNamed(context, '/question');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.greenAccent, // Set your desired button color
                  ),
                  child: const Text('Start HTML Quiz'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
