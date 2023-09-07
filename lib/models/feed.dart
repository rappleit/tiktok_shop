class FeedItem {
  final String id;
  final String? parentId;
  final String userId;
  final String content;
  final DateTime postDate;

  FeedItem({
    required this.id,
    this.parentId,
    required this.userId,
    required this.content,
    required this.postDate,
  });
}
