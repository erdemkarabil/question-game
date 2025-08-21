import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart, // Add callback for restart
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestart; // Callback to trigger restart

  List<Map<String, Object?>> getSummaryData() {
    final List<Map<String, Object?>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':
            questions[i].answers[0], // Assuming first answer is correct
        'user_answer': i < chosenAnswers.length
            ? chosenAnswers[i]
            : 'No answer',
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 13, 151),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Quiz Results',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Expanded(
                child: ListView.builder(
                  itemCount: summaryData.length,
                  itemBuilder: (context, index) {
                    final item = summaryData[index];
                    return Card(
                      color: const Color.fromARGB(255, 149, 39, 222),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              color: const Color.fromARGB(255, 78, 13, 151),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Question ${(item['question_index'] as int) + 1}',
                                  style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: const Color.fromARGB(255, 78, 13, 151),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Question: ${item['question']}',
                                  style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: const Color.fromARGB(255, 78, 13, 151),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Correct Answer: ${item['correct_answer']}',
                                  style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: const Color.fromARGB(255, 78, 13, 1510),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Your Answer: ${item['user_answer']}',
                                  style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35),
              Text(
                'Review your answers below!',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: onRestart, // Use the callback
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  backgroundColor: const Color.fromARGB(255, 78, 13, 151),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Restart Quiz!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
