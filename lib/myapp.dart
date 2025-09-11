import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/injections_imports.dart';
import 'package:news_app/features/news/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:news_app/core/theme/theme_notifier.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => sl<NewsBloc>()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.white,
              cardColor: Colors.white,
            ),
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              cardColor: Colors.black,
            ),
            themeMode: themeNotifier.currentMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
