enum QuestDifficulty {
  easy,
  medium,
  hard,
}

enum Occasion {
  christmas,
  birthday,
  anniversary,
  valentinesDay,
  easter,
  thanksgiving,
  halloween,
  other,
}

class Quest {
  final String id;
  final String title;
  final String description;
  final QuestDifficulty difficulty;
  final Occasion occasion;
  final DateTime startDate;
  final DateTime endDate;

  Quest({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.occasion,
    required this.startDate,
    required this.endDate,
  });
}
