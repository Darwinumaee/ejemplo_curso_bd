import 'package:flutter/material.dart';
import 'exercise_screen.dart';
import 'progress_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CURSO DE SQL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen()));
              },
              child: Text('Iniciar el curso'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressScreen()));
              },
              child: Text('Revisa tu progreso'),
            ),
          ],
        ),
      ),
    );
  }
}
