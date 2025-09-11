import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/widgets/news/news_list.dart';

class NewsTabs extends StatelessWidget {
  const NewsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, // Number of categories
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "NEWS",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          bottom: const TabBar(
            tabs: [Tab(text: "Business")],
            labelStyle: TextStyle(
              fontSize: 25,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: NewsWidget(),
      ),
    );
  }
}
