import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:portfolio/models/displayed_image.dart';

class ImagePickerWidget extends StatefulWidget {
  final CurrentDisplayedImage updateImageView;

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
    // Get binary for file
    Uint8List fileBin = await binary;
    File file = File.fromRawPath(fileBin);
    setState(() {
      // Set _recievedFile to the decoded binary file
      _recievedFile = file;
    });
  }

  void startWebFilePicker() async {
    // Open file picking
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    // Get files
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();

      // Encode files
      reader.onLoadEnd.listen((event) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }

  Future makeRequest() async {
    // Set url to request
    Uri url = Uri.parse(_serverUrl);
    // Create a MultipartRequest
    var request = new http.MultipartRequest("POST", url);
    // Add file to MultipartRequest
    request.files.add(await http.MultipartFile.fromBytes("file", _selectedFile,
        contentType: new MediaType("application/json", "multipart/form-data"),
        filename: "file_up"));

    request.send().then((response) async {
      // Handle and output response
      int responseCode = response.statusCode;
      print("\nResponse: $responseCode");
      if (response.statusCode == 200) print("Successfully uploaded.");

      File _transferedImage = File(
          "/home/alpharaoh/Documents/coding/flutter/PersonalPortfolioProject/PersonalPortfolio/assets/images/test.jpg");

      // // Convert response binary to File type and set _receivedImage
      // convertRetrievedBinary(response.stream.toBytes());

      print(_transferedImage);
      // Change displayed image to _recievedFile
      widget.updateImageView.changeImage(_transferedImage);
    });
  }

  void _handleResult(Object result) {
    setState(() {
      // Convert file to byte string and encode using base64
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
