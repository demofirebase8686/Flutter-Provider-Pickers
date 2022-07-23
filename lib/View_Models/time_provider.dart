import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimeProvider with ChangeNotifier {
  late TimeOfDay _currentTime = TimeOfDay.now();
  late String message;

  TimeOfDay get currentTime => _currentTime;
  String get msg => message;

  //* pick time function
  void pickTimeFunction(BuildContext context) async {
    final pickedTime =
        await showTimePicker(context: context, initialTime: _currentTime);

    if (pickedTime != null) {
      _currentTime = pickedTime;
    } else {
      message = "no Time selected";
    }
    notifyListeners();
  }
}
