part of 'injections_imports.dart';


Future<void> initializeDependencies() async {
  //datasources
  sl.registerLazySingleton(() => NewsRemoteDatasource());
  //repositories
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(remoteDatasource: sl()));
  //usecases
  sl.registerLazySingleton(() => Getallposts(newsRepository: sl()));
  //blocs
  sl.registerFactory(() => NewsBloc(getallposts: sl()));
}