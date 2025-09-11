import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/domain/entities/articleentity.dart';
import 'package:news_app/features/news/domain/usecases/getallposts.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Getallposts getallposts;
  NewsBloc({required this.getallposts}) : super(NewsInitial()) {
    on<FetchNewsPostsEvent>(fetchNewsPostsEvent);
  }

  FutureOr<void> fetchNewsPostsEvent(FetchNewsPostsEvent event, Emitter<NewsState> emit) async{
    emit(NewsLoadingState());
    final result = await getallposts(null);
    print('final data : $result');
    result.fold(
      (failure) => emit(NewsErrorState(message: failure.message)), 
      (articles) => emit(NewsLoadedSuccessState(newsPosts: articles)));
  }
}
