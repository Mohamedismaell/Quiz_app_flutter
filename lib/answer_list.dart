import 'package:fa_list_app/answer_button.dart';
import 'package:flutter/material.dart';

class AnswerList extends StatelessWidget {
  final List<String> answer;
  final void Function(String) onTap;
  const AnswerList({super.key, required this.answer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...answer.map((answer) {
          return AnswerButton(answerText: answer, ontap: () => onTap(answer));
        }),
      ],
    );
  }
}
