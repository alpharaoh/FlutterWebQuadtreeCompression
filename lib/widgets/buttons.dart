import 'package:flutter/material.dart';
// Models import
import '../models/displayed_image.dart';

class ButtonsGroup extends StatefulWidget {
  final Function updateImageView;

  ButtonsGroup({@required this.updateImageView});

  @override
  _ButtonsGroupState createState() => _ButtonsGroupState();
}

class _ButtonsGroupState extends State<ButtonsGroup> {
  downloadAlertDioalog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.blueAccent,
            children: [
              // Download is ready pop up
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
              downloadAlertDioalog(context);
            },
            child: Icon(
              Icons.download_sharp,
              color: Colors.white,
            ),
          ),
          // Upload action button
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
