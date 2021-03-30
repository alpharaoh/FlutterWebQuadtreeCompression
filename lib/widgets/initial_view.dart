import 'package:flutter/material.dart';

class InitialView extends StatefulWidget {
  @override
  _InitialViewState createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  bool _isVisible = true;

  void hideView() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 15, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "This application is designed to\nwork on a computer browser",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                height: 50.0,
                width: 200.0,
                child: MaterialButton(
                  color: Colors.black,
                  onPressed: () => hideView(),
                  child: Text(
                    "I understand, let me in!",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
