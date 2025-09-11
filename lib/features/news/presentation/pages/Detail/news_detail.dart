import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';
import 'package:news_app/features/news/presentation/widgets/Detail/detail.dart';

class NewsDetailPage extends StatelessWidget {
  final ArticleEntity article;

  const NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return DetailWidget(article: article);
  }
}
