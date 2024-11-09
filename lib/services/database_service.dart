import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sql_trainer.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE progress(level INTEGER, correct_answers INTEGER)',
        );
      },
    );
  }

  Future<void> saveProgress(int level, int correctAnswers) async {
    try {
      final db = await database;
      await db.insert('progress', {'level': level, 'correct_answers': correctAnswers},
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('Error saving progress: $e');
    }
  }

  Future<Map<String, dynamic>?> getProgress() async {
    try {
      final db = await database;
      final result = await db.query('progress', limit: 1);
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      print('Error loading progress: $e');
      return null;
    }
  }
}
