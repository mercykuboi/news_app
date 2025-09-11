import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';
import 'package:news_app/features/news/presentation/pages/home/home_page.dart';
import 'package:news_app/features/news/presentation/pages/news/news_page.dart';
import 'package:news_app/features/news/presentation/widgets/Detail/header.dart';
import 'package:news_app/features/news/presentation/widgets/Detail/content.dart';

class DetailWidget extends StatelessWidget {
  final ArticleEntity article;

  const DetailWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Drawer navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text("Business"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const NewsPage()),
                );
              },
            ),
          ],
        ),
      ),

      // ✅ Custom Header
      appBar: 
  
      NewsDetailHeader(

        title: "NEWS",
        headerTitle: "Business News",
        onThemePressed: () {
          // TODO: Theme toggle
        },
        //scaffoldKey: _scaffoldKey,
      ),

      // ✅ Content area
      body: NewsDetailContent(article: article),
    );
  }
}
