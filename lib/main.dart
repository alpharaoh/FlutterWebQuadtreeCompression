import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// stless
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline4: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: HomeView(title: "Image Quadtree Compression"),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;
  //ctor
  HomeView({this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // private var
  // public var has no underscore
  int _counter = 0;
  double _currentSliderVal = 20;

  String _image =
      "https://designshack.net/wp-content/uploads/placeholder-image.png";

  void getImage() {
    setState(() {
      _image =
          "https://pbs.twimg.com/profile_images/1113234846288109568/Orw73sVE_400x400.jpg";
    });
  }

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  // List<Color> _colour = [
  //   Colors.blueAccent,
  //   Colors.redAccent,
  //   Colors.deepPurpleAccent,
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0, // app bar shadow
        title: Center(child: Text(widget.title)),
      ),

      // floatingActionButton: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       FloatingActionButton(
      //         onPressed: getImage,
      //         child: Icon(Icons.arrow_back),
      //       ),
      //       SizedBox(
      //         width: 10.0,
      //       ),
      //       FloatingActionButton(
      //         onPressed: resetCounter,
      //         child: Icon(Icons.file_download),
      //       ),
      //       SizedBox(
      //         width: 10.0,
      //       ),
      //       FloatingActionButton(
      //         onPressed: _decreaseCounter,
      //         child: Icon(Icons.remove),
      //       ),
      //       SizedBox(
      //         width: 10.0,
      //       ),
      //       FloatingActionButton(
      //         onPressed: _increaseCounter,
      //         child: Icon(Icons.add),
      //       )
      //     ],
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Image",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Image.network("$_image"),
            Container(
              width: 300.0,
              child: Slider(
                value: _currentSliderVal,
                min: 0,
                max: 100,
                label: _currentSliderVal.round().toString(),
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _currentSliderVal = value;
                  });
                },
              ),
            ),
            Container(
              width: 500.0,
              height: 100.0,
              margin: EdgeInsets.only(top: 250.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: getImage,
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  FloatingActionButton(
                    onPressed: resetCounter,
                    child: Icon(Icons.file_download),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  FloatingActionButton(
                    onPressed: _decreaseCounter,
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  FloatingActionButton(
                    onPressed: _increaseCounter,
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
