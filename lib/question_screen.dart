import 'package:fa_list_app/answer_list.dart';
import 'package:fa_list_app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionCurrentIndex = 0;
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();

    shuffledAnswers = questions[questionCurrentIndex].getShuffledAnswers();
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      questionCurrentIndex++;
      if (questionCurrentIndex < questions.length) {
        shuffledAnswers = questions[questionCurrentIndex].getShuffledAnswers();
      }
      // print("questionCurrentIndex is: ${questionCurrentIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionCurrentIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: AnswerList(answer: shuffledAnswers, onTap: answerQuestion),
        ),
      ],
    );
  }
}
