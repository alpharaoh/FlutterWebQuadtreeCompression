import 'package:flutter/material.dart';
import 'package:portfolio/models/quadtree_settings.dart';
import 'package:portfolio/widgets/numeric_updown.dart';

class Sliders extends StatefulWidget {
  final QuadTreeSettings settings;

  Sliders({@required this.settings});

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  bool showLines = false;
  bool gif = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Container for sliders
          Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: 0.0),
        child: Column(
          children: [
            // Depth slider
            Container(
              width: 300.0,
              child: Slider(
                value: widget.settings.depthValue,
                min: 0,
                max: 8,
                label: (widget.settings.depthValue).toString(),
                divisions: 8,
                onChanged: (value) {
                  setState(() {
                    widget.settings.changeDepthValue(value);
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
                value: widget.settings.detailValue,
                min: 1,
                max: 30,
                label: (widget.settings.detailValue).toString(),
                divisions: 29,
                onChanged: (value) {
                  setState(() {
                    widget.settings.changeDetailValue(value);
                  });
                },
              ),
            ),
            Container(
              child: Text(
                "DETAIL THRESHOLD",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
              width: 500.0,
              child: Column(
                children: [
                  NumericUpDown(settings: widget.settings),
                ],
              ),
            ),
            Container(
              width: 300.0,
              child: Slider(
                value: widget.settings.maxDepthValue,
                min: 1,
                max: 10,
                label: (widget.settings.maxDepthValue).toString(),
                divisions: 9,
                onChanged: (value) {
                  setState(() {
                    widget.settings.changeMaxDepthValue(value);
                  });
                },
              ),
            ),
            Container(
              child: Text(
                "MAX DEPTH",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              width: 300.0,
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text("GIF"),
                      Checkbox(
                        activeColor: Colors.blue,
                        value: showLines,
                        onChanged: (newValue) {
                          setState(() {
                            showLines = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("LINES"),
                      Checkbox(
                        activeColor: Colors.blue,
                        value: gif,
                        onChanged: (newValue) {
                          setState(() {
                            gif = newValue;
                          });
                        },
                      ),
                    ],
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
