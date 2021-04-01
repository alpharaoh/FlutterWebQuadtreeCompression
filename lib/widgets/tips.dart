import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tips extends StatefulWidget {
  final String tip;
  // final double right;
  // final double top;

  Tips({
    @required this.tip,
    // @required this.right,
    // @required this.top,
  });

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
    return Positioned(
      // right: widget.right,
      // top: widget.top,
      child: Container(
        child: SizedBox(
          child: Row(
            children: [
              Visibility(
                visible: tipVisible,
                child: Container(
                  color: Colors.black38,
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
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.precise,
                  onEnter: showTip,
                  onExit: hideTip,
                  child: Container(
                    child: Icon(
                      Icons.help,
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
