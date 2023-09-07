class GiftFinder {
  final String userId;
  final List<GiftRecipient> recipients;

  GiftFinder({
    required this.userId,
    required this.recipients,
  });
}

class GiftRecipient {
  final String userId;
  final String name;
  final String age;
  final String content;
  final List<String> interests;

  GiftRecipient({
    required this.userId,
    required this.name,
    required this.age,
    required this.content,
    required this.interests,
  });
}
