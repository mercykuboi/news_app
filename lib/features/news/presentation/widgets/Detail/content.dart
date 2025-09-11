import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';

class NewsDetailContent extends StatefulWidget {
  final ArticleEntity article;

  const NewsDetailContent({super.key, required this.article});

  @override
  State<NewsDetailContent> createState() => _NewsDetailContentState();
}

class _NewsDetailContentState extends State<NewsDetailContent> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final article = widget.article;

    final content = article.content;
    final desc = article.description;
    // Merge content + description
    // final fullText = "${article.description ?? ""}\n\n${article.content ?? ""}"
    //     .trim();
    final fullText = content;
    final words = fullText!.split(" "); 

    // Short preview (first 200 characters)
    final previewText = words.length > 20
        ? "${words.take(20).join(" ")}..."
        : fullText;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Headline (big title above image)
          Text(
            article.title ?? "No Title",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          // Author + Date
          Row(
            children: [
              if (article.author != null)
                Text(
                  "By ${article.author}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              const Spacer(),
              Text(
                article.publishedAt.toString().substring(0, 10),
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              article.urlToImage ?? "https://picsum.photos/800/400?random",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),


           Text(
            desc!,            
            style: const TextStyle(fontSize: 16, height: 1.5, fontStyle: FontStyle.italic),
          ),
          // Article Text
          const SizedBox(height: 20,),
          Text(
            _showMore ? fullText : previewText,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),

          if (fullText.length > 200)
            TextButton(
              onPressed: () {
                setState(() {
                  _showMore = !_showMore;
                });
              },
              child: Text(
                _showMore ? "Show Less" : "Show More",
                style: const TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
