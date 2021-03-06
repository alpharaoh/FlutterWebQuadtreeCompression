import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuadTreeHelp extends StatefulWidget {
  @override
  _QuadTreeHelpState createState() => _QuadTreeHelpState();
}

class _QuadTreeHelpState extends State<QuadTreeHelp> {
  double fontSizeThreshold = 14.0;

  // double getFontSize() {
  //   double fontSize = MediaQuery.of(context).size.height * 0.015;
  //   if (fontSize > fontSizeThreshold) {
  //     return fontSizeThreshold;
  //   }
  //   return fontSize;
  // }

  double getLetterSpacing() {
    if (MediaQuery.of(context).size.height < 805) {
      return 0.0;
    }
    return 2.0;
  }

  String _textContent1 =
      "Quadtrees are a type of tree data structure where each node in the tree has four children. For image compression we can use quadtrees to divide two-dimensional spaces into smaller and smaller quadrants. These quadrants will hold data for it's average colour, current depth in the quadtree and it's colour 'detail'.";
  String _textContent2 =
      "The quadtree will stop dividing once we reach a maximum depth or detail threshold. With this data we can recreate the image filling in the quadrants with their average colour.";
  String _textContent3 =
      "This program was built in Python3 using Pillow, NumPy and OpenCV. This web application you are currently using is built in Flutter.";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        children: [
          Stack(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Image
              Container(
                margin: EdgeInsets.only(left: 50.0),
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("images/example_image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(top: 30.0, right: 40.0),
                child: Column(
                  children: [
                    Text(
                      "QUADTREE\nCOMPRESSION",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.035,
                        letterSpacing: getLetterSpacing(),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 500.0,
            padding: EdgeInsets.only(
                right: 50.0,
                left: 50.0,
                top: MediaQuery.of(context).size.height * 0.025),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Container(
                height: 460.0,
                width: 300.0,
                child: Text(
                  // "Hello Hello dasd sad as adsads d  dsa  dsad adsa  dsa",
                  _textContent1 +
                      "\n\n" +
                      _textContent2 +
                      "\n\n" +
                      _textContent3,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 13.0,
                  ),
                  // minFontSize: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
