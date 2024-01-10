import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_news/core/colors.dart';
import 'package:tech_news/presentation/pages/home.dart';

import 'bloc/news_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.primary
      ),
      home: BlocProvider(
        create: (context) => NewsBloc() ..add(FetchNewsEvent()),
        child: const HomePage(),
      ),
    );
  }
}
