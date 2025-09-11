import 'package:flutter/material.dart';
import 'package:news_app/core/resources/injections_imports.dart';
import 'package:news_app/myapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}


