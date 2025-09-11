import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black54, body: HomeWidget());
  }
}
