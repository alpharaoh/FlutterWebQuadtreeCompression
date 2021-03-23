import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/image_view.dart';
import '../widgets/image_holder.dart';

class ButtonsGroup extends StatefulWidget {
  final Function updateImageView;

  ButtonsGroup({@required this.updateImageView});

  @override
  _ButtonsGroupState createState() => _ButtonsGroupState();
}

class _ButtonsGroupState extends State<ButtonsGroup> {
  ImageView image = ImageView();

  void updateImage() {}

  downloadAlertDioalog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.blueAccent,
            children: [
              Container(
                width: 130.0,
                height: 30.0,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Text(
                      "DOWNLOAD IS READY",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4.0,
                        fontSize: 14.0,
                      ),
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
      width: 200,
      //color: Colors.amber,
      //margin: EdgeInsets.only(top: 150.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /*
          These are the widgets for reset, download and upload buttons
          */
          // reset action button
          FloatingActionButton(
            backgroundColor: Colors.black38,
            onPressed: () {},
            child: Icon(
              Icons.refresh_sharp,
              color: Colors.white,
            ),
          ),
          // download action button
          FloatingActionButton(
            backgroundColor: Colors.black38,
            onPressed: () {
              downloadAlertDioalog(context);
              //startDownload();
            },
            child: Icon(
              Icons.download_sharp,
              color: Colors.white,
            ),
          ),
          // upload action button
          FloatingActionButton(
            backgroundColor: Colors.black38,
            onPressed: widget.updateImageView,
            child: Icon(
              Icons.arrow_upward_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
