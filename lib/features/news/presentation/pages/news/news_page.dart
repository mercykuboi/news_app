import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/widgets/widgets.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: NewsTabs());
  }
}
