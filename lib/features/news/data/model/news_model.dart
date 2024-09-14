import 'package:news_app/features/news/domain/entity/news.dart';

class NewsModel extends News {
  NewsModel({
    required super.sourceId,
    required super.sourceName,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.image,
    required super.publishedAt,
    required super.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      sourceId: json['source']['id'] ?? '',
      sourceName: json['source']['name'] ?? '',
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      image: json['urlToImage'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'] ?? '',
    );
  }

  // Method to convert a NewsArticle to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'source': {
        'id': sourceId,
        'name': sourceName,
      },
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': image,
      'publishedAt': publishedAt.toIso8601String(),
      'content': content,
    };
  }
}
