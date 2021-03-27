import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/models/text_formatter.dart';

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
                  Container(
                    child: Text(
                      "ADVANCED OPTIONS",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    width: 250.0,
                    height: 60.0,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: TextFormField(
                        inputFormatters: [
                          SizeMultiplierTextFormatter(),
                        ],
                        keyboardType: TextInputType.number,
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 2.0),
                        decoration: InputDecoration(
                          fillColor: Colors.amber,
                          border: InputBorder.none,
                        ),
                        // helperStyle: Theme.of(context).textTheme.bodyText2,
                        // helperText:
                        //     "2.0 will return an image twice as large"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
