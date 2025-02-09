import 'package:flutter/material.dart';
import 'package:oruphones_assignment/core/configs/theme/app_theme.dart';
import 'package:oruphones_assignment/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORUPhones',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashPage(),
    );
  }
}


