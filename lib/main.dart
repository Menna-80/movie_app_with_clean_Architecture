import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/utils/services_locator.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade800,
      ),
      home: const MoviesScreen(),
    );
  }
}
