import 'package:flutter/material.dart';
import 'package:my_personal_website/screens/main.dart';
import 'package:my_personal_website/utilities/design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Design.getThemeData(),
      home: MainPage(),
    );
  }
}