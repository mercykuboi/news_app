import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';
import 'package:news_app/features/news/presentation/pages/Detail/news_detail.dart';

class OneNewsArticle extends StatelessWidget {
  final String category;
  final ArticleEntity articleEntity;

  const OneNewsArticle({
    super.key,
    required this.articleEntity,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: Colors.blueGrey,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(18),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              articleEntity.urlToImage!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          title: Row(
            children: [
              // Text with background color
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    articleEntity.title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Arrow icon
              const Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: Colors.black,
              ),
            ],
          ),
          subtitle: Text(
            (articleEntity.publishedAt).toString().substring(0, 10),
            style: const TextStyle(color: Colors.amber, fontSize: 20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailPage(article: articleEntity),
              ),
            );
          },
        ),
      ),
    );
  }
}
