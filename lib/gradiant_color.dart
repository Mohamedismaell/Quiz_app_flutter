import 'package:flutter/material.dart';

class GradiantColor extends StatelessWidget {
  const GradiantColor(
    this.primarycolor,
    this.secondarycolor,
    this.customwidget, {
    super.key,
  });
  final Color primarycolor;
  final Color secondarycolor;
  final Widget customwidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primarycolor, secondarycolor]),
      ),
      child: Center(child: customwidget),
    );
  }
}
