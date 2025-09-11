import 'package:news_app/core/usecases/common_usecase.dart';
import 'package:news_app/core/utils/typedef.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

class Getallposts extends CommonUsecase<List<ArticleEntity>, void>{
  final NewsRepository newsRepository;

  Getallposts({required this.newsRepository});

  @override
  ResultFuture<List<ArticleEntity>> call(void params) {
    return newsRepository.getNewsPosts();
  }
  
  
}