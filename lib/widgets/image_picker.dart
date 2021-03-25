import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:dio/dio.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImageHolderState createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImagePickerWidget> {
  List<int> _selectedFile;
  Uint8List _bytesData;
  GlobalKey _formKey = new GlobalKey();

  void startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();

      reader.onLoadEnd.listen((event) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }

  Future makeRequest() async {
    Map<String, String> headers = {
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Host": "localhost:8000",
      "Sec-Fetch-Dest": "empty",
      "Sec-Fetch-Mode": "cors",
      "Sec-Fetch-Site": "same-origin"
    };
    Uri url = Uri.parse("http://localhost:8000/quadtree/upload/image/");
    var request = new http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromBytes("file", _selectedFile,
        contentType: new MediaType("application/json", "multipart/form-data"),
        filename: "file_up"));

    request.send().then((response) {
      print("test");
      print(response.statusCode);
      if (response.statusCode == 200) print("Successfully uploaded.");
    });
  }

  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
          //color: Colors.black45,
          width: 200.0,
          height: 40.0,
          child: OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () => startWebFilePicker(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.add_sharp),
                Text(
                  "SELECT IMAGE",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
        Container(
          //padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
          //color: Colors.black45,
          width: 40.0,
          height: 40.0,
          child: OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () => makeRequest(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.upload_file)],
            ),
          ),
        ),
      ],
    );
  }
}
// Future<String> uploadImage() async {
//   var request = http.MultipartRequest(
//       "POST", Uri.parse("http://localhost:8000/quadtree/upload/image/"));
//   request.files.add(http.MultipartFile(
//       "picture", _image.readAsBytes().asStream(), _image.lengthSync(),
//       filename: "test.jpg"));
// }

// String status = '';
// String errMessage = 'Error Uploading Image';

//

// void startUpload() {
//   status = 'Uploading Image...';
//   print(status);
//   upload();
// }

// void upload() {
//   http.post(endpoint, body: {
//     "image": _image.readAsBytes(),
//   }).then((result) {
//     status = (result.statusCode == 200 ? result.body : errMessage);
//   }).catchError((error) {
//     status = error;
//   });

//   print(status);
// }

// _image.readAsBytes().asStream(),
// _image.lengthSync(),

//////
///
///
///File _image;
// final ImagePicker picker = ImagePicker();
// Uri url = Uri.parse("http://localhost:8000/quadtree/upload/image/");

// void uploadImage() async {
//   var request = http.MultipartRequest('POST', url);

//   request.files.add(await http.MultipartFile.fromBytes("file", _image,
//       contentType: MediaType("application", "octet-stream"),
//       filename: "file_up"));
// }

// Future getImage() async {
//   PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);

//   setState(() {
//     if (pickedFile != null) {
//       _image = File.fromUri(Uri.parse(pickedFile.path));
//     } else {
//       print("No image selected");
//     }
//   });
// }
