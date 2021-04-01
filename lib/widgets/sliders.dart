import 'package:flutter/material.dart';
import 'package:portfolio/models/quadtree_settings.dart';
import 'package:portfolio/widgets/numeric_updown.dart';
import 'package:portfolio/widgets/tips.dart';

class Sliders extends StatefulWidget {
  final QuadTreeSettings settings;

  Sliders({@required this.settings});

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  bool showLines = false;
  bool gif = false;
  double maxDepth = 9;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Container for sliders
          Container(
        // color: Colors.black,
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Depth slider
            Stack(
              children: [
                Tips(
                  tip: "The max amount of times the quadtree will split",
                ),
                Container(
                  width: 300.0,
                  child: SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Colors.blue,
                      activeTrackColor: Colors.blueAccent,
                    ),
                    child: Slider(
                      value: widget.settings.depthValue,
                      min: 0,
                      max: maxDepth,
                      label: (widget.settings.depthValue).toString(),
                      divisions: maxDepth.toInt(),
                      onChanged: (value) {
                        setState(() {
                          widget.settings.changeDepthValue(value);
                        });
                      },
                    ),
                  ),
                ),
              ],
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
              child: SliderTheme(
                data: SliderThemeData(
                  thumbColor: Colors.blue,
                  activeTrackColor: Colors.blueAccent,
                ),
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
            ),
            Container(
              child: Text(
                "DETAIL THRESHOLD",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              width: 500.0,
              child: Column(
                children: [
                  NumericUpDown(settings: widget.settings),
                ],
              ),
            ),
            Container(
              width: 300.0,
              // margin: EdgeInsets.only(
              //     top: MediaQuery.of(context).size.height * 0.00005),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text("GIF"),
                      Checkbox(
                        activeColor: Colors.blue,
                        value: widget.settings.isGif,
                        onChanged: (newValue) {
                          setState(() {
                            widget.settings.changeIsGifBool(newValue);
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
                        value: widget.settings.showLines,
                        onChanged: (newValue) {
                          setState(() {
                            widget.settings.changeShowLinesBool(newValue);
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
