import 'package:flutter/material.dart';

class ImagePickerButtons extends StatefulWidget {
  final Function startWebFilePicker;

  ImagePickerButtons({@required this.startWebFilePicker});

  @override
  _ImagePickerButtonsState createState() => _ImagePickerButtonsState();
}

class _ImagePickerButtonsState extends State<ImagePickerButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            height: 40.0,
            child: OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () => widget.startWebFilePicker(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.add_sharp),
                  Text(
                    "SELECT IMAGE",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
