import 'package:fantacy_quiz/data/source/question_sources.dart';
import 'package:fantacy_quiz/pages/quiz_page.dart';
import 'package:fantacy_quiz/widgets/custom_result_container.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final List<int> selectedAnswers;

  const ResultPage({super.key, required this.selectedAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE8E2),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                "assets/images/icon.png",
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Results of Fantasy Quiz",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF24286A)),
            ),
            const SizedBox(height: 30),
            CustomResultContainer(
              icon: Icons.money,
              title: "SCORE GAINED",
              number: "${_calculateCorrectAnswers() * 4}",
            ),
            const SizedBox(height: 4),
            CustomResultContainer(
              icon: Icons.done,
              title: "CORRECT PREDICTIONS",
              number: "${_calculateCorrectAnswers()}",
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuizPage())),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF30CD63)),
                child: const Text(
                  "OKAY",
                  style: TextStyle(color: Color(0xFFF5F3F7), fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int _calculateCorrectAnswers() {
    int correctAnswers = 0;
    final data = QuestionSources.correctAnswers;
    for (int i = 0; i < data.length; i++) {
      if (data[i] == selectedAnswers[i]) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }
}
