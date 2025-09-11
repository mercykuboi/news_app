import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/utils/typedef.dart';
import 'package:news_app/features/news/data/datasources/remote/remote_datasource.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository{
  final NewsRemoteDatasource remoteDatasource;

  NewsRepositoryImpl({required this.remoteDatasource});
  @override
  ResultFuture<List<ArticleModel>> getNewsPosts() async{
    try {
      final articles = await remoteDatasource.fetchAllPosts();
      return Right(articles);
    } on SocketException catch (e) {
      return Left(NetworkFailure(message: e.message.isNotEmpty? e.message : "No Internet connection"));
    }on TimeoutException {
      return Left(TimeoutFailure(message: "The request timed out, please try again"));
    }catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
    
  }
}