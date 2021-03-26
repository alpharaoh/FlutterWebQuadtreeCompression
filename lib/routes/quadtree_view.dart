import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/image_picker.dart';
// Widgets Import
import 'package:portfolio/widgets/sliders.dart';
import 'package:portfolio/widgets/buttons.dart';
import 'package:portfolio/widgets/image_holder.dart';
// Models Import
import 'package:portfolio/models/displayed_image.dart';

// Home View
class HomeView extends StatefulWidget {
  final String title;
  // Constructor
  HomeView({this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CurrentDisplayedImage imageView = CurrentDisplayedImage();
  File imageToViewer;

  // Methods
  void getImageSrc() {
    setState(() {
      imageToViewer = imageView.getImage();
    });
  }

  void changeImageSrc(File image) {
    setState(() {
      imageToViewer = image;
    });
  }

  // Widget View
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                // Left
                ImageHolder(imageToViewer),
                // Right
                SidebarWidget(
                    updateImageHandler: changeImageSrc,
                    getImageHandler: getImageSrc),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Slider and Button Holder Container
class SidebarWidget extends StatefulWidget {
  final Function updateImageHandler;
  final Function getImageHandler;

  // Pass in function
  SidebarWidget(
      {@required this.updateImageHandler, @required this.getImageHandler});

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // sidebar
      height: MediaQuery.of(context).size.height,
      width: 420.0,
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Slider
          Sliders(),
          ImagePickerWidget(updateImageView: widget.updateImageHandler),
          // Container for buttons
          ButtonsGroup(
              updateImageView:
                  widget.getImageHandler), // Pass in function to Buttons class
        ],
      ),
    );
  }
}
