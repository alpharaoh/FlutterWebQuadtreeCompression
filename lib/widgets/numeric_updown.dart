import 'package:flutter/material.dart';

class NumericUpDown extends StatefulWidget {
  @override
  _NumericUpDownState createState() => _NumericUpDownState();
}

class _NumericUpDownState extends State<NumericUpDown> {
  var textController = new TextEditingController();

  double _sizeMultValue = 1.0;

  void upCounter() {
    setState(() {
      _sizeMultValue += 0.01;
      textController.text =
          double.parse(_sizeMultValue.toStringAsFixed(2)).toString();
    });
  }

  void downCounter() {
    setState(() {
      _sizeMultValue -= 0.01;
      textController.text =
          double.parse(_sizeMultValue.toStringAsFixed(2)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "SIZE MUTLIPLIER",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Container(
            width: 100.0,
            child: TextFormField(
              style: TextStyle(
                color: Colors.white54,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 6.0,
              ),
              //initialValue: _sizeMultValue.toString(),
              controller: textController,
              textAlign: TextAlign.right,
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
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
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
