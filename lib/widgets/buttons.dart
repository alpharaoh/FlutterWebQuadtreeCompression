import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonsGroup extends StatefulWidget {
  final Function makeRequest;
  final Uint8List binary;
  final String file_type;

  ButtonsGroup({
    @required this.makeRequest,
    @required this.binary,
    @required this.file_type,
  });

  @override
  _ButtonsGroupState createState() => _ButtonsGroupState();
}

class _ButtonsGroupState extends State<ButtonsGroup> {
  void startDownload() {
    final content = base64Encode(widget.binary);
    AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$content")
      ..setAttribute("download", "quadtree_image.${widget.file_type}")
      ..click();
  }

  downloadAlertDioalog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.blueAccent,
            children: [
              // Download is ready pop up
              Container(
                width: 200.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.download_done_sharp,
                      color: Colors.white,
                    ),
                    Text(
                      "DOWNLOAD IS READY",
                      style: GoogleFonts.raleway(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
      width: 220,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.black38,
            onPressed: () => widget.makeRequest(),
            child: Icon(
              Icons.upload_sharp,
              color: Colors.white,
            ),
          ),
          // Reset action button
          FloatingActionButton(
            backgroundColor: Colors.black38,
            onPressed: () {},
            child: Icon(
              Icons.refresh_sharp,
              color: Colors.white,
            ),
          ),
          // Download action button
          FloatingActionButton(
            backgroundColor: Colors.black38,
            onPressed: () {
              startDownload();
              downloadAlertDioalog(context);
            },
            child: Icon(
              Icons.download_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
