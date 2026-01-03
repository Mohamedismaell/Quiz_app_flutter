import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiez, {super.key});
  final void Function() startQuiez;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.7,
              child: Image.asset('assets/images/quiz-logo.png'),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Learn flutter with fun way",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                startQuiez();
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.arrow_forward_rounded),
              label: Text("Start The Quize", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
