import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/models/quadtree_settings.dart';
import 'package:portfolio/widgets/credits.dart';
import 'package:portfolio/widgets/helper_text.dart';
import 'package:portfolio/widgets/initial_view.dart';
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
          Stack(
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
          // InitialView(),
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
      width: (320 +
          MediaQuery.of(context).size.width *
              0.05), //MediaQuery.of(context).size.width / 5 + 13.4,
      color: Color.fromARGB(255, 20, 20, 20),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              //height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  QuadTreeHelp(),
                ],
              ),
            ),
          ),
          // Slider
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Color.fromARGB(255, 15, 15, 15),
              //height: 511.0,
              child: Column(
                children: [
                  Credits(),
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
                ],
              ),
            ),
          ),
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
