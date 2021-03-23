import 'dart:developer';
import 'package:flutter/material.dart';
// Widgetr Import
import '../widgets/sliders.dart';
import '../widgets/buttons.dart';
import '../widgets/image_holder.dart';
// Models Import
import '../models/image_view.dart';

// Home View
class HomeView extends StatefulWidget {
  final String title;
  //ctor
  HomeView({this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> startDownload() async {
    log("Download should start");
  }

  ImageView imageView = ImageView();
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
                ImageViewer(imageToViewer),
                SidebarWidget(changeImageSrc),
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

  SidebarWidget(void Function() changeImageSrc,
      {@required this.updateImageHandler, Key key})
      : super(key: key, updateImageHandler: updateImageHandler);

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
          // Container for buttons
          ButtonsGroup(widget.updateImageHandler),
        ],
      ),
    );
  }
}
