import 'package:flutter/foundation.dart';

class CurrentDisplayedImage {
  String image_src = '';

  CurrentDisplayedImage({this.image_src});

  String getImage() {
    return "https://upload.wikimedia.org/wikipedia/commons/b/b9/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpg";
  }
}