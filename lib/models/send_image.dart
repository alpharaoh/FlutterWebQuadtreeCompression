// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class StartPage extends StatelessWidget {
//   @override
//   Widget build(context) {
//     TextEditingController controller = TextEditingController();
//     return Scaffold(
//         appBar: AppBar(title: Text('Flutter File Upload Example')),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Text("http://localhost:8000/quadtree/upload/image/",
//                   style: Theme.of(context).textTheme.headline5),
//               TextField(
//                 controller: controller,
//                 onSubmitted: (str) => () {},
//               ),
//               TextButton(
//                 child: Text("Take me to the upload screen"),
//                 onPressed: () => () {},
//               )
//             ],
//           ),
//         ));
//   }
// }
