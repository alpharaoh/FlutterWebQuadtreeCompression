import 'package:flutter/material.dart';
import '../models/image_view.dart';

class ImageViewer extends StatefulWidget {
  final String _currentImage;

  ImageViewer(this._currentImage);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  String _placehold = "https://static.thenounproject.com/png/1686943-200.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: Container(
          color: Colors.black38,
          // need max width height
          width: 1500.0,
          height: MediaQuery.of(context).size.height,
          child: (widget._currentImage == null)
              ? Image.network(_placehold)
              : Image.network(widget._currentImage),
        ),
      ),
    );
  }
}
