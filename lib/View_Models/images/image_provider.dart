import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageProvider with ChangeNotifier {
  final _picker = ImagePicker();
  File? _imageFile;
  List<XFile?> imageFiles = [];

  String? message;

  File? get imageFile => _imageFile;
  List<XFile?> get ximageFiles => imageFiles;
  String? get errorMessage => message;

  //* get image fuction
  void pickImage(ImageSource source) async {
    try {
      final pickedImage = await _picker.pickImage(source: source);
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      } else {
        message = "No Image Selected";
      }
    } catch (e) {
      message = e.toString();
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.redAccent,
      );
    }
    notifyListeners();
  }

  //* clear image function
  void clearImage() async {
    _imageFile = null;
    notifyListeners();
  }

  //* get multiple images function

  Future<List<XFile?>> getMultipleImages(ImageSource? source) async {
    imageFiles = [];
    List<XFile> files = [];
    try {
      final pickedImages = await _picker.pickMultiImage();
      if (pickedImages != null) {
        files.addAll(pickedImages);
        imageFiles = files;
      } else {
        Fluttertoast.showToast(msg: "No Images is selected");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    }
    notifyListeners();
    return files;
  }
}
