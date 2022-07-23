import 'package:flutter/material.dart';

class Utils {
  static navigateToPage(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
        ));
  }
}
