part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoadingState extends NewsState{
  const NewsLoadingState();
}
class NewsLoadedSuccessState extends NewsState{
  final List<ArticleEntity> newsPosts;
  const NewsLoadedSuccessState({required this.newsPosts});
  @override
  List<Object> get props => [newsPosts];
}
class NewsErrorState extends NewsState{
  final String message;

  const NewsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}