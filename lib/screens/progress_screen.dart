import 'package:flutter/material.dart';
import '../services/database_service.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int currentLevel = 1;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  void _loadProgress() async {
    final progress = await DatabaseService().getProgress();
    if (progress != null) {
      setState(() {
        currentLevel = progress['level'];
        correctAnswers = progress['correct_answers'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Level: $currentLevel', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Correct Answers in a Row: $correctAnswers', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
