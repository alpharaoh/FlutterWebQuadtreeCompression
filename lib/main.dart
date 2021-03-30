import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Routes import
import 'routes/quadtree_view.dart';

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
          bodyText2: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
            fontSize: 11.0,
          ),
          headline4: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline1: GoogleFonts.raleway(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 35.0,
            letterSpacing: 1.0,
          ),
          headline5: GoogleFonts.raleway(
            fontWeight: FontWeight.w700,
            color: Colors.blue,
            fontSize: 13.0,
            letterSpacing: 1.0,
          ),
          headline2: GoogleFonts.raleway(
            fontWeight: FontWeight.w900,
            color: Colors.white12,
            fontSize: 35.0,
            letterSpacing: 1.0,
          ),
          bodyText1: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            fontSize: 13.0,
          ),
          headline6: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 15.0,
          ),
        ),
      ),
      home: HomeView(title: "Image Quadtree Compression"),
    );
  }
}
