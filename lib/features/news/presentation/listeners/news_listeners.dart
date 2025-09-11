import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/blocs/news_bloc/news_bloc.dart';

void newsListeners(BuildContext context, NewsState state){
    if (state is NewsErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
    }
    else if(state is NewsLoadedSuccessState){
      ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Response Success: ${state.newsPosts.length}')));
    }
}