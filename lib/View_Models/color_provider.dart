import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:providers_pickers/Views/colors/app_colors.dart';

class CustomColorProvider with ChangeNotifier {
  late Color _color = AppColors.appBarColor;

  Color get color => _color;

  // void pickColor() async {
  //   final pickedColor = await BlockPicker(
  //     onColorChanged: (Color newColor) {
  //       _color = newColor;
  //     },
  //     useInShowDialog: true,
  //     pickerColor: _color,
  //   );
  // }

  void colorChangeFunction(Color color) {
    _color = color;
    notifyListeners();
  }
}
