import 'package:flutter/material.dart';
import 'exercise_screen.dart';
import 'progress_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQL Trainer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen()));
              },
              child: Text('Start Training'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressScreen()));
              },
              child: Text('View Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
