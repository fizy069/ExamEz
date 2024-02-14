import 'package:exam_ezx/views/exam_page.dart';
import 'package:flutter/material.dart';
import 'views/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        hintColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: ExamsPage(),
    );
  }
}
