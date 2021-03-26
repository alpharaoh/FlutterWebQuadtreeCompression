import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  final Function updateImageView;

  ImagePickerWidget({@required this.updateImageView});

  @override
  _ImageHolderState createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImagePickerWidget> {
  String _serverUrl = "http://localhost:8000/quadtree/upload/image/";
  List<int> _selectedFile;
  Uint8List _bytesData;
  File _recievedFile;

  void convertRetrievedBinary(binary) async {
    Uint8List file = await binary;
    setState(() {
      _recievedFile = File.fromRawPath(file);
    });
  }

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
    Uri url = Uri.parse(_serverUrl);
    var request = new http.MultipartRequest("POST", url);
    // request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromBytes("file", _selectedFile,
        contentType: new MediaType("application/json", "multipart/form-data"),
        filename: "file_up"));

    request.send().then((response) {
      int responseCode = response.statusCode;
      print("\nResponse: $responseCode");
      if (response.statusCode == 200) print("Successfully uploaded.");

      convertRetrievedBinary(response.stream.toBytes());
      print(_recievedFile);
      // Change displayed image to _recievedFile
      widget.updateImageView(_recievedFile);
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
