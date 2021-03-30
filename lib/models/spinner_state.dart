class Spinner {
  // final bool spinnerVisible = false;
  bool spinnerVisible;

  Spinner({this.spinnerVisible});

  void startSpinner() {
    this.spinnerVisible = true;
  }

  void stopSpinner() {
    this.spinnerVisible = false;
  }

  bool getState() {
    return this.spinnerVisible;
  }
}
