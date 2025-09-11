import 'package:news_app/features/news/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final Source source;
  final String? author;
  final String? title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  const ArticleEntity({
    required this.source,
    this.author,
    this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });
  @override
  List<Object?> get props => [
    source,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}
