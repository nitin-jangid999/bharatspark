import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  runApp(const BharatSparkApp());
}

class BharatSparkApp extends StatelessWidget {
  const BharatSparkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BharatSpark',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
