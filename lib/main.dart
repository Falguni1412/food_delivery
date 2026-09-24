import 'package:flutter/material.dart';
import 'screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodFast',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // First screen to show
    );
  }
}
