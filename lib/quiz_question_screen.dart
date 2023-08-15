import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/quiz_modal.dart';
import 'package:quiz_project/quiz_provider.dart';

class QuizQuestionScreen extends StatelessWidget {
  const QuizQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final userScoreProvider = Provider.of<UserScoreProvider>(context);

    final currentQuestion =
        quizProvider.currentQuestions[quizProvider.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Question')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0), // Adjust margin as needed
          elevation: 4.0, // Card elevation
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Question: ${quizProvider.currentQuestionIndex + 1}',
                    style: const TextStyle(fontSize: 12.0)),
                const SizedBox(height: 16.0), // Add spacing
                Text(
                  currentQuestion.questionText,
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 16.0), // Add spacing
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: currentQuestion.options.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<int>(
                      title: Text(currentQuestion.options[index]),
                      value: index,
                      groupValue: quizProvider.selectedOptionIndex,
                      onChanged: (value) {
                        quizProvider.setSelectedOptionIndex(value!);
                      },
                      activeColor: Colors.green, // Color when selected
                      // Customizing the tile's background color
                      tileColor: quizProvider.selectedOptionIndex == index
                          ? Colors.greenAccent
                          : null,
                    );
                  },
                ),
                const SizedBox(height: 24.0), // Add spacing
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (quizProvider.selectedOptionIndex ==
                          currentQuestion.correctOptionIndex) {
                        userScoreProvider.incrementScore();
                      }
                      quizProvider.nextQuestion();

                      if (quizProvider.currentQuestionIndex >=
                          quizProvider.currentQuestions.length) {
                        Navigator.pushReplacementNamed(context, '/result');
                      } else {
                        quizProvider.resetSelectedOptionIndex();
                        Navigator.pushReplacementNamed(context, '/question');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.greenAccent, // Set your desired button color
                    ),
                    child: const Text('Next Question'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
