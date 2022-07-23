import 'package:country_code_picker/country_code.dart';
import 'package:flutter/cupertino.dart';

class CustomCountryProvider with ChangeNotifier {
  late CountryCode _countryCode = CountryCode.fromDialCode("+91");
  late String _fullnumber;

  CountryCode get countryCode => _countryCode;
  String get fullNumber => _fullnumber;

  void changeCountryCode(CountryCode code) async {
    _countryCode = code;
    notifyListeners();
  }
}
