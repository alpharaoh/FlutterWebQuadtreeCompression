import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageHolder extends StatefulWidget {
  final File _currentImage;

  ImageHolder(this._currentImage);

  @override
  _ImageHolderState createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImageHolder> {
  // No image placeholder
  final String _placehold =
      "https://static.thenounproject.com/png/140281-200.png";

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
          // If current image is not present, we display placeholder image, otherwise we get current image
          child: (widget._currentImage == null)
              ? Image.network(_placehold)
              : Image.file(widget._currentImage),
        ),
      ),
    );
  }
}
