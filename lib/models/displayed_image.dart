import 'dart:io';
import 'package:flutter/foundation.dart';

class CurrentDisplayedImage {
  File image_src;

  CurrentDisplayedImage({this.image_src});

  File getImage() {
    return image_src;
  }

  // void changeImage(File file) {
  //   image_src = file;
  // }
}
