import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    Color colorCheck(Map<String, Object> data) {
      return data['user_answer'] == data['correct_answer']
          ? Colors.pink
          : const Color.fromARGB(255, 61, 181, 237);
    }

    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: colorCheck(data),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 186, 109, 200),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 61, 181, 237),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
