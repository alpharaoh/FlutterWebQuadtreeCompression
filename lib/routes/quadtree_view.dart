import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/models/quadtree_settings.dart';
import 'package:portfolio/widgets/credits.dart';
import 'package:portfolio/widgets/helper_text.dart';
import 'package:portfolio/widgets/server_connection.dart';
// Widgets Import
import '../widgets/sliders.dart';
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
  // Spinner spinner = Spinner();
  bool spinnerVisible = false;

  // bool spin = false;

  // Methods
  void changeImageSrc() {
    setState(() {
      imageToViewer = imageView.getImage();
    });
  }

  void startSpinner() {
    setState(() {
      spinnerVisible = true;
    });
  }

  void stopSpinner() {
    setState(() {
      spinnerVisible = false;
    });
  }

  // Widget View
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
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
                      startSpinner: startSpinner,
                      stopSpinner: stopSpinner,
                    )
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Spinner(spinnerVisible: spinnerVisible),
          ),
        ],
      ),
    );
  }
}

// Slider and Button Holder Container
class SidebarWidget extends StatefulWidget {
  final Function updateImageHandler;
  final CurrentDisplayedImage imageViewObj;
  final QuadTreeSettings settings;
  final Function startSpinner;
  final Function stopSpinner;

  // Pass in function
  SidebarWidget({
    @required this.updateImageHandler,
    @required this.imageViewObj,
    @required this.settings,
    @required this.startSpinner,
    @required this.stopSpinner,
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
            startSpinner: widget.startSpinner,
            stopSpinner: widget.stopSpinner,
          ),
          // Container for buttons
          // ButtonsGroup(),
        ],
      ),
    );
  }
}

class Spinner extends StatefulWidget {
  final bool spinnerVisible;

  Spinner({
    @required this.spinnerVisible,
  });

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.spinnerVisible,
      child: Container(
        color: Colors.black38,
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
