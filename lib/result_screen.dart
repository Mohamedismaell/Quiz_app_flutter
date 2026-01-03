import 'package:fa_list_app/data/questions.dart';
import 'package:fa_list_app/models/question_summary.dart';
// import 'package:fa_list_app/quiz.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.restartTheQuize, {
    super.key,
    required this.choosenAnswers,
  });
  final void Function() restartTheQuize;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotaouestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "You have answered $numCorrectAnswers out of $numTotaouestions!",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            SizedBox(height: 30),
            QuestionSummary(summaryData),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                restartTheQuize();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.replay_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Text(
                    "Restart The Quiz",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
