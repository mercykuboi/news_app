import 'package:news_app/core/utils/typedef.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';

abstract class NewsRepository {
  ResultFuture<List<ArticleEntity>> getNewsPosts();
}