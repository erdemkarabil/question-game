import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    print('Selected answer: $selectedAnswer');
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        print('Next question index: $currentQuestionIndex');
      }
      // Remove the else block to let Quiz widget handle navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      print('Error: Questions list is empty');
      return const Center(child: Text('No questions available!'));
    }

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AnswerButton(
                      answerText: answer,
                      onTap: () {
                        print('Tapped answer: $answer');
                        answerQuestion(answer);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
