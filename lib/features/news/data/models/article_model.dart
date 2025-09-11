import 'package:news_app/features/news/data/models/source_model.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required super.source,
    required super.url,
    required super.publishedAt,
    super.author,
    super.title,
    super.description,
    super.urlToImage,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json),
      url: json['url'],
      publishedAt: DateTime.parse(json['publishedAt']),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      content: json['content'] ?? ""
    );
  }
}
