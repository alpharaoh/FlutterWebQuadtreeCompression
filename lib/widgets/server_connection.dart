import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';

import 'package:portfolio/models/displayed_image.dart';
import 'package:portfolio/models/quadtree_settings.dart';
import 'package:portfolio/widgets/buttons.dart';
import 'package:portfolio/widgets/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final CurrentDisplayedImage imageView;
  final Function updateImageView;
  final QuadTreeSettings settings;
  final Function startSpinner;
  final Function stopSpinner;

  ImagePickerWidget({
    @required this.imageView,
    @required this.updateImageView,
    @required this.settings,
    @required this.startSpinner,
    @required this.stopSpinner,
  });

  @override
  _ImageHolderState createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImagePickerWidget> {
  String _serverUrl = "http://localhost:8000/quadtree/upload/image/";
  List<int> _selectedFile;
  Uint8List _bytesData;
  String _file_name;
  List<Image> images;
  Uint8List imageBinaryData;
  String file_type;

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
      setState(() {
        _file_name = file.name;
      });
      file_type = (widget.settings.isGif) ? "gif" : _file_name.split(".").last;
      // Encode files
      reader.onLoadEnd.listen((event) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }

  Future makeRequest() async {
    if (_file_name == null) {
      return;
    }
    widget.startSpinner();
    // Set url to request
    Uri url = Uri.parse(_serverUrl);
    // Create a MultipartRequest
    var request = new http.MultipartRequest("POST", url);
    // Add file to MultipartRequest
    request.files.add(await http.MultipartFile.fromBytes("file", _selectedFile,
        contentType: new MediaType("application/json", "multipart/form-data"),
        filename: _file_name));

    // Add settings to form
    request.files.add(http.MultipartFile.fromString(
        "depth", widget.settings.depthValue.toString()));
    request.files.add(http.MultipartFile.fromString(
        "detail", widget.settings.detailValue.toString()));
    // request.files.add(http.MultipartFile.fromString(
    //     "max_depth", widget.settings.maxDepthValue.toString()));
    request.files.add(http.MultipartFile.fromString(
        "size_mult", widget.settings.sizeMultValue.toString()));
    request.files.add(http.MultipartFile.fromString(
        "show_lines", widget.settings.showLines.toString()));
    request.files.add(http.MultipartFile.fromString(
        "is_gif", widget.settings.isGif.toString()));

    request.send().then((response) async {
      // Handle and output response
      String currentDate =
          DateFormat('yyyy-MM-dd ??? kk:mm').format(DateTime.now());
      if (response.statusCode == 200)
        print("Successfully uploaded - $currentDate");

      // Convert response binary to File type and set _receivedImage
      var future = response.stream.toBytes();
      future.then((binary) {
        setState(() {
          imageBinaryData = binary;
          // Get file from binary
          Image _recievedFile = Image.memory(binary);
          // Change displayed image to _recievedFile
          widget.imageView.changeImage(_recievedFile);
          widget.updateImageView();
        });
      });

      widget.stopSpinner();
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
    return Column(
      children: [
        ImagePickerButtons(startWebFilePicker: startWebFilePicker),
        ButtonsGroup(
          makeRequest: makeRequest,
          binary: imageBinaryData,
          file_type: file_type,
        )
      ],
    );
  }
}
