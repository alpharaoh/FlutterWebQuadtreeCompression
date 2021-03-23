import 'package:flutter/material.dart';
import './routes/home_views.dart';

// Application Entry
void main() {
  runApp(MyApp());
}

// Application Entry Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 6.0,
          ),
          headline4: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: HomeView(title: "Image Quadtree Compression"),
    );
  }
}
