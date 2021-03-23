import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double _depthSlider = 7;

  double _detailSlider = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Container for sliders
          Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            /*
                These are the widgets for detail and depth slider
                */
            Container(
              width: 300.0,
              child: Slider(
                value: _depthSlider,
                min: 0,
                max: 8,
                label: _depthSlider.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _depthSlider = value;
                  });
                },
              ),
            ),
            Container(
              child: Text(
                "DEPTH",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              width: 300.0,
              child: Slider(
                value: _detailSlider,
                min: 1,
                max: 30,
                label: _detailSlider.round().toString(),
                //divisions: 40,
                onChanged: (value) {
                  setState(() {
                    _detailSlider = value;
                  });
                },
              ),
            ),
            Container(
              child: Text(
                "DETAIL",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
