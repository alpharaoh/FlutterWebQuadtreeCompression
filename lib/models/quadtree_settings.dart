class QuadTreeSettings {
  double depthValue = 7.0;
  double detailValue = 15.0;
  double maxDepthValue = 8.0;
  double sizeMultValue = 1.0;

  List<String> getValues() {
    List<String> list = List<String>.filled(4, "");
    list[0] = depthValue.toString();
    list[1] = detailValue.toString();
    list[2] = maxDepthValue.toString();
    list[3] = sizeMultValue.toString();

    return list;
  }

  void changeDepthValue(double val) {
    depthValue = val;
  }

  void changeDetailValue(double val) {
    detailValue = val;
  }

  void changeMaxDepthValue(double val) {
    maxDepthValue = val;
  }

  void changeSizeMultValue(double val) {
    sizeMultValue = val;
  }
}
