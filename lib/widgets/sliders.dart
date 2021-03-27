import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/models/text_formatter.dart';
import 'package:portfolio/widgets/numeric_updown.dart';

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  // Slider values
  double _depthSlider = 7.0;
  double _detailSlider = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Container for sliders
          Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            // Depth slider
            Container(
              width: 300.0,
              child: Slider(
                value: _depthSlider,
                min: 0,
                max: 8,
                label: "$_depthSlider",
                divisions: 8,
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
            // Detail slider
            Container(
              width: 300.0,
              child: Slider(
                value: _detailSlider,
                min: 1,
                max: 30,
                label: "$_detailSlider",
                divisions: 29,
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
            Container(
              margin: EdgeInsets.only(top: 80.0),
              padding: EdgeInsets.all(20.0),
              width: 500.0,
              child: Column(
                children: [
                  // Container(
                  //   child: Text(
                  //     "ADVANCED OPTIONS",
                  //     style: Theme.of(context).textTheme.bodyText2,
                  //   ),
                  // ),
                  NumericUpDown(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
