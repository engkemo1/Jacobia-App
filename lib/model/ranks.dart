class Ranks {
  int? correctAnswer;
  String? name;

  Ranks({
    required this.correctAnswer,
    required this.name,
  });

  Ranks.fromJson(Map<dynamic, dynamic> map) {
    name = map['type'];
    correctAnswer = map['answer'];
  }
}
