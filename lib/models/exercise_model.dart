class Exercise {
  final String question;
  final String answer;
  final int difficultyLevel;

  Exercise({required this.question, required this.answer, required this.difficultyLevel});

  // Método para verificar la respuesta
  bool isCorrect(String userAnswer) {
    return userAnswer.trim().toLowerCase() == answer.trim().toLowerCase();
  }
}
