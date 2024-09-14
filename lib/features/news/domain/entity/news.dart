class News {
  final String sourceId;
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String image;
  final DateTime publishedAt;
  final String content;

  News({
    required this.sourceId,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.content,
  });
}
