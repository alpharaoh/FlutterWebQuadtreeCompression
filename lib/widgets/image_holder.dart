import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageHolder extends StatefulWidget {
  final Image _currentImage;

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
      width: MediaQuery.of(context).size.width -
          (320 + MediaQuery.of(context).size.width * 0.05),
      color: Color.fromARGB(225, 25, 25, 25),
      child: Stack(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.grab,
            child: Center(
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(100),
                minScale: 0.01,
                maxScale: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  // If current image is not present, we display placeholder image, otherwise we get current image
                  child: (widget._currentImage == null)
                      ? Image.network(_placehold)
                      : widget._currentImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
