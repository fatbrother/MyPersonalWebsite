import 'package:flutter/material.dart';
import 'package:my_personal_website/body.dart';
import 'package:my_personal_website/utilities/design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fatbrother\'s Website',
        debugShowCheckedModeBanner: false,
        theme: Design.getThemeData(),
        routes: {'/': (context) => MainPage()},
        initialRoute: '/',
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => MainPage(),
          );
        });
  }
}
