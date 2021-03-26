import 'dart:io';

import 'package:flutter/foundation.dart';

class CurrentDisplayedImage {
  File image_src;

  CurrentDisplayedImage({this.image_src});

  File getImage() {
    return this.image_src;
  }

  void changeImage(File image) {
    this.image_src = image;
  }
}
