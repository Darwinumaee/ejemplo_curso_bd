import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../services/exercise_generator.dart';
import '../widgets/exercise_card_widget.dart';
import '../widgets/level_progress_widget.dart';
import '../services/database_service.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late List<Exercise> exercises;
  late Exercise currentExercise;
  int currentExerciseIndex = 0;
  int correctAnswers = 0;
  int level = 1;

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  void _loadExercises() {
    exercises = ExerciseGenerator().generateExercises(level);
    currentExerciseIndex = 0;
    currentExercise = exercises[currentExerciseIndex];
  }

  void _checkAnswer(String userAnswer) {
    if (currentExercise.isCorrect(userAnswer)) {
      correctAnswers++;

      // Avanza al siguiente ejercicio si quedan ejercicios en el nivel actual
      if (currentExerciseIndex < exercises.length - 1) {
        setState(() {
          currentExerciseIndex++;
          currentExercise = exercises[currentExerciseIndex];
        });
      } else {
        // Si se completaron todos los ejercicios, sube de nivel
        _advanceToNextLevel();
      }

      // Guarda el progreso en la base de datos
      DatabaseService().saveProgress(level, correctAnswers);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Correcto!')));

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrecto. Intente Otra Vez!')));
    }
  }

  void _advanceToNextLevel() {
    setState(() {
      level++;
      correctAnswers = 0;
      _loadExercises(); // Cargar ejercicios para el nuevo nivel
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Felicidades! Subiste de nivel $level')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curso de SQL')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LevelProgressWidget(correctAnswers: correctAnswers, targetAnswers: exercises.length),
            SizedBox(height: 20),
            ExerciseCardWidget(
              exercise: currentExercise,
              onAnswerSubmit: _checkAnswer,
            ),
          ],
        ),
      ),
    );
  }
}