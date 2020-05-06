import 'package:flutter/material.dart';
import 'package:yaikibar/pages/tabs_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w200,
            color: Colors.brown,
          ),
          headline2: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
      ),
      home: TabsExample(),
    );
  }
}
