import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/image_picker.dart';
// Widgets Import
import '../widgets/sliders.dart';
import '../widgets/buttons.dart';
import '../widgets/image_holder.dart';
// Models Import
import '../models/displayed_image.dart';
import 'package:flutter/material.dart';

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
  Image imageToViewer;

  // Methods
  void changeImageSrc() {
    setState(() {
      imageToViewer = imageView.getImage();
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
                    imageViewObj: imageView),
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
  final CurrentDisplayedImage imageViewObj;

  // Pass in function
  SidebarWidget(
      {@required this.updateImageHandler, @required this.imageViewObj});

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
          ImagePickerWidget(updateImageView: widget.imageViewObj),
          // Container for buttons
          ButtonsGroup(
              updateImageView: widget
                  .updateImageHandler), // Pass in function to Buttons class
        ],
      ),
    );
  }
}
