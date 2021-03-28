import 'package:flutter/material.dart';
import 'package:portfolio/models/quadtree_settings.dart';

class NumericUpDown extends StatefulWidget {
  final QuadTreeSettings settings;

  NumericUpDown({@required this.settings});

  @override
  _NumericUpDownState createState() => _NumericUpDownState();
}

class _NumericUpDownState extends State<NumericUpDown> {
  var textController = new TextEditingController();

  void upCounter() {
    setState(() {
      widget.settings.changeSizeMultValue(widget.settings.sizeMultValue + 0.01);
      textController.text =
          double.parse(widget.settings.sizeMultValue.toStringAsFixed(2))
              .toString();
    });
  }

  void downCounter() {
    setState(() {
      widget.settings.changeSizeMultValue(widget.settings.sizeMultValue - 0.01);
      textController.text =
          double.parse(widget.settings.sizeMultValue.toStringAsFixed(2))
              .toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "SIZE MUTLIPLIER",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Container(
            width: 60.0,
            margin: EdgeInsets.only(bottom: 10.0),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white54,
                // fontSize: 15.0,
                // fontWeight: FontWeight.w500,
                // letterSpacing: 6.0,
              ),
              //initialValue: _sizeMultValue.toString(),
              controller: textController,
              onChanged: (val) =>
                  widget.settings.changeSizeMultValue(double.parse(val)),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.black38,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
                  hintText: "1.0"),
            ),
          ),
          Container(
            width: 40.0,
            height: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  child: TextButton(
                    onPressed: () => upCounter(),
                    child: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                ),
                Container(
                  height: 20.0,
                  width: 20.0,
                  child: TextButton(
                    onPressed: () => downCounter(),
                    child: Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
