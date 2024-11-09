import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../services/exercise_generator.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late List<Exercise> exercises;
  late Exercise currentExercise;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    exercises = ExerciseGenerator().generateExercises(1);
    currentExercise = exercises[0];
  }

  void checkAnswer() {
    if (currentExercise.isCorrect(_controller.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Correcto!')));
      // Lógica de progresión de nivel o cambio de ejercicio
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Intenta otra vez!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicios de SQL')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(currentExercise.question, style: TextStyle(fontSize: 18)),
            TextField(controller: _controller, decoration: InputDecoration(labelText: 'Escribe aquí tu respuesta')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAnswer, child: Text('Aceptar'))
          ],
        ),
      ),
    );
  }
}
