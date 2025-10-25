import 'package:easy_travel/main_page.dart';
import 'package:easy_travel/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {

    MaterialTheme theme = MaterialTheme(TextTheme());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: Scaffold(
        body: SafeArea(child: MainPage()),
      ),
    );
  }
}