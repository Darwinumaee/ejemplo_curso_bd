import 'package:flutter/material.dart';
import '../models/exercise_model.dart';

class ExerciseCardWidget extends StatelessWidget {
  final Exercise exercise;
  final Function(String) onAnswerSubmit;

  ExerciseCardWidget({required this.exercise, required this.onAnswerSubmit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exercise.question, style: TextStyle(fontSize: 18)),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Escribe tu respuesta'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => onAnswerSubmit(_controller.text),
              child: Text('Es correcto?'),
            ),
          ],
        ),
      ),
    );
  }
}
