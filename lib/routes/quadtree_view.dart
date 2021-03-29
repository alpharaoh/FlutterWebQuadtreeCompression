import 'package:flutter/material.dart';
import 'package:portfolio/models/quadtree_settings.dart';
import 'package:portfolio/widgets/credits.dart';
import 'package:portfolio/widgets/helper_text.dart';
import 'package:portfolio/widgets/server_connection.dart';
// Widgets Import
import '../widgets/sliders.dart';
import '../widgets/buttons.dart';
import '../widgets/image_holder.dart';
// Models Import
import '../models/displayed_image.dart';

// Home View
class HomeView extends StatefulWidget {
  final String title;
  // Constructor
  HomeView({this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Image holder
  CurrentDisplayedImage imageView = CurrentDisplayedImage();
  Image imageToViewer;
  // QuadTree settings
  QuadTreeSettings settings = QuadTreeSettings();

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
                  imageViewObj: imageView,
                  settings: settings,
                )
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
  final QuadTreeSettings settings;

  // Pass in function
  SidebarWidget({
    @required this.updateImageHandler,
    @required this.imageViewObj,
    @required this.settings,
  });

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
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          QuadTreeHelp(),
          Credits(),
          // Slider
          Sliders(
            settings: widget.settings,
          ),
          ImagePickerWidget(
            imageView: widget.imageViewObj,
            updateImageView: widget.updateImageHandler,
            settings: widget.settings,
          ),
          // Container for buttons
          // ButtonsGroup(),
        ],
      ),
    );
  }
}
