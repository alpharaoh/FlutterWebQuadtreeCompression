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

  // void zoomInViewer() {}

  // void zoomOutViewer() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -
          (320 + MediaQuery.of(context).size.width * 0.05),
      color: Color.fromARGB(225, 25, 25, 25),
      child: Stack(children: [
        MouseRegion(
          cursor: SystemMouseCursors.grab,
          child: Center(
            child: InteractiveViewer(
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.1,
              maxScale: 3,
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
        // Container(
        //   padding: EdgeInsets.all(30.0),
        //   alignment: Alignment.topRight,
        //   height: 170.0,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         width: 50.0,
        //         height: 50.0,
        //         child: FloatingActionButton(
        //           onPressed: () {},
        //           child: Icon(
        //             Icons.zoom_in_sharp,
        //             color: Colors.white,
        //             size: 30.0,
        //           ),
        //           backgroundColor: Colors.black54,
        //         ),
        //       ),
        //       Container(
        //         //padding: EdgeInsets.only(top: 20.0),
        //         width: 50.0,
        //         height: 50.0,
        //         child: FloatingActionButton(
        //           onPressed: () {},
        //           child: Icon(
        //             Icons.zoom_out_sharp,
        //             color: Colors.white,
        //             size: 30.0,
        //           ),
        //           backgroundColor: Colors.black54,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Container(
        //       width: 400.0,
        //       height: 100.0,
        //       color: Colors.black38,
        //       child: Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             Image(
        //               height: 80.0,
        //               width: 80.0,
        //               image: AssetImage("images/image_icon.png"),
        //               fit: BoxFit.cover,
        //             ),
        //             Image(
        //               height: 80.0,
        //               width: 80.0,
        //               image: AssetImage("images/image_icon.png"),
        //               fit: BoxFit.cover,
        //             ),
        //             Image(
        //               height: 80.0,
        //               width: 80.0,
        //               image: AssetImage("images/image_icon.png"),
        //               fit: BoxFit.cover,
        //             ),
        //             Image(
        //               height: 80.0,
        //               width: 80.0,
        //               image: AssetImage("images/image_icon.png"),
        //               fit: BoxFit.cover,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
