import 'package:get_it/get_it.dart';
import 'package:news_app/features/news/data/datasources/remote/remote_datasource.dart';
import 'package:news_app/features/news/data/repository/news_repository_impl.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';
import 'package:news_app/features/news/domain/usecases/getallposts.dart';
import 'package:news_app/features/news/presentation/blocs/news_bloc/news_bloc.dart';

part 'injections.dart';

final sl = GetIt.instance;
