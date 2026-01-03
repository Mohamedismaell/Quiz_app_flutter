import 'package:fa_list_app/data/questions.dart';
import 'package:fa_list_app/widgets/gradiant_color.dart';
import 'package:fa_list_app/screens/result_screen.dart';
import 'package:fa_list_app/screens/start_screen.dart';
import 'package:fa_list_app/screens/question_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuiezState();
}

class _QuiezState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswer = [];
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  // void restartTheQuize() {
  //   selectedAnswer = [];
  //   setState(() {
  //     activeScreen = QuestionScreen(onSelectedAnswer: chooseAnswer);
  //   });
  // }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = ResultScreen(
          switchScreen,
          choosenAnswers: selectedAnswer,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = QuestionScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GradiantColor(Colors.deepPurple, Colors.purple, activeScreen!),
        ),
      ),
    );
  }
}
