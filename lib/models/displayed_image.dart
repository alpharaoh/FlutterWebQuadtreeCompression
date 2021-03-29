import 'package:flutter/material.dart';

class CurrentDisplayedImage {
  Image image_src;

  CurrentDisplayedImage({this.image_src});

  Image getImage() {
    return this.image_src;
  }

  void changeImage(Image image) {
    this.image_src = image;
  }
}
