import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/listeners/news_listeners.dart';
import 'package:news_app/features/news/presentation/widgets/widgets.dart';
import 'package:news_app/features/news/presentation/widgets/news/featured_news_article.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: newsListeners,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsLoadedSuccessState) {
          final featuredArticle = state.newsPosts.isNotEmpty
              ? state.newsPosts[0]
              : null;
          final otherArticles = state.newsPosts.length > 1
              ? state.newsPosts.sublist(1)
              : [];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured article using its widget
                if (featuredArticle != null)
                  FeaturedNewsArticle(
                    article: featuredArticle,
                    onTap: () {
                      debugPrint("Clicked featured: ${featuredArticle.title}");
                    },
                  ),

                const SizedBox(height: 20),

                // Other articles using OneNewsArticle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: otherArticles
                        .map(
                          (article) => OneNewsArticle(
                            articleEntity: article,
                            category: 'Business',
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
