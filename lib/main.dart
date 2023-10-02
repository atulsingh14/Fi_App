import 'package:fi/common/color_sheme.dart';
import 'package:fi/views/intro/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fi',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: FColor.primary,
          background: FColor.gray80,
          primary: FColor.primary,
          primaryContainer: FColor.gray60,
          secondary: FColor.secondary,
        ),
        useMaterial3: false,
      ),
      home: const IntroPage(),
    );
  }
}
