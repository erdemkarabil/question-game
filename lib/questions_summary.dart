import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object?>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(((data['question_index'] as int? ?? 0) + 1).toString()),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['question'] as String? ?? 'No question'),
                  const SizedBox(height: 5),
                  Text(data['user_answer'] as String? ?? 'No answer'),
                  Text(
                    data['correct_answer'] as String? ?? 'No correct answer',
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
