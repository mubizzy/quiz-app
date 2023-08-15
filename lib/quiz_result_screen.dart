import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/quiz_modal.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userScoreProvider = Provider.of<UserScoreProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quiz Completed', style: TextStyle(fontSize: 30.0)),
            const SizedBox(
              height: 20,
            ),
            Text('Your Score: ${userScoreProvider.userScore.score * 100}',
                style: const TextStyle(fontSize: 30.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    userScoreProvider.resetScore();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.greenAccent, // Set your desired button color
                  ),
                  child: const Text('Play Again'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
