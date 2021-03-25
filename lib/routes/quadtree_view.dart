import 'dart:developer';
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
  String imageToViewer = '';

  // Methods
  void changeImageSrc() {
    setState(() {
      imageToViewer =
          'https://upload.wikimedia.org/wikipedia/commons/b/b9/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpg';
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
                SidebarWidget(updateImageHandler: changeImageSrc),
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

  // Pass in function
  SidebarWidget({@required this.updateImageHandler});

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
          ImagePickerWidget(),
          // Container for buttons
          ButtonsGroup(
              updateImageView: widget
                  .updateImageHandler), // Pass in function to Buttons class
        ],
      ),
    );
  }
}