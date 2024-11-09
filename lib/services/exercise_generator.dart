import '../models/exercise_model.dart';

class ExerciseGenerator {
  List<Exercise> generateExercises(int level) {
    List<Exercise> exercises = [];
    if (level == 1) {
      exercises.add(Exercise(
          question: 'Crea una base de datos de nombre test_db',
          answer: 'CREATE DATABASE test_db;',
          difficultyLevel: 1));
      // Agrega más ejercicios de nivel 1
    } else if (level == 2) {
      exercises.add(Exercise(
          question: 'Crear una tabla denominada usuario que contenga las columnas id y nombre de usuario',
          answer: 'CREATE TABLE users (id INT, name VARCHAR(100));',
          difficultyLevel: 2));
      // Agrega más ejercicios de nivel 2
    }
    // Continuar con niveles adicionales
    return exercises;
  }
}
