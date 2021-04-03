import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tips extends StatefulWidget {
  final String tip;

  Tips({@required this.tip});

  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  bool tipVisible = false;

  void showTip(PointerEvent details) {
    setState(() {
      tipVisible = true;
    });
  }

  void hideTip(PointerEvent details) {
    setState(() {
      tipVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.precise,
                onEnter: showTip,
                onExit: hideTip,
                child: Container(
                  child: Icon(
                    Icons.help,
                    size: 20.0,
                    color: Colors.white10,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: tipVisible,
              child: Container(
                color: Colors.black87,
                padding: EdgeInsets.only(
                    right: 10.0, left: 10.0, top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text(
                    widget.tip,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
