import 'package:flutter/material.dart';

class LevelProgressWidget extends StatelessWidget {
  final int correctAnswers;
  final int targetAnswers;

  LevelProgressWidget({required this.correctAnswers, required this.targetAnswers});

  @override
  Widget build(BuildContext context) {
    double progress = correctAnswers / targetAnswers;

    return Column(
      children: [
        Text('Progress: $correctAnswers / $targetAnswers'),
        LinearProgressIndicator(value: progress, minHeight: 10),
      ],
    );
  }
}
