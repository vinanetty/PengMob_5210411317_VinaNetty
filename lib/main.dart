import 'package:flutter/material.dart';
import 'package:paml_flutter_responsi/screens/splash_screen.dart';
import 'package:paml_flutter_responsi/src/constants/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PengMob',
      theme: ThemeData(
        fontFamily: 'Poppins', 
        primaryColor: kPrimaryColor,
      ),
      home: const SplashScreen(),      
    );
  }
}
