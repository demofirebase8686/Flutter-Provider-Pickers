import 'package:flutter/material.dart';

class CustomDateProvider with ChangeNotifier {
  late final DateTime _initialDate = DateTime.now();
  late final DateTime _firstDate = DateTime(1960);
  late final DateTime _lastDate = DateTime(2023);
  late DateTime _currentDate = DateTime.now();

  DateTime get initialDate => _initialDate;
  DateTime get firstDate => _firstDate;
  DateTime get lastDate => _lastDate;
  DateTime get currentDate => _currentDate;

  //* pick date function
  void pickDateFunction(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (pickedDate != null) {
      _currentDate = pickedDate;
      notifyListeners();
    }
  }

  //* onDateChanged Function;
  void onDateChangedFunction(DateTime dateTime) {
    _currentDate = dateTime;
    notifyListeners();
  }
}
