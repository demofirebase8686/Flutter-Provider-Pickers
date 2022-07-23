// ignore_for_file: unnecessary_null_comparison

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/View_Models/country_provider.dart';
import 'package:providers_pickers/Views/colors/app_colors.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

class CountryPickerScreen extends StatefulWidget {
  const CountryPickerScreen({Key? key}) : super(key: key);

  @override
  State<CountryPickerScreen> createState() => _CountryPickerScreenState();
}

class _CountryPickerScreenState extends State<CountryPickerScreen> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Country Code Picker Provider")),
      body: Consumer<CustomCountryProvider>(builder: (context, provider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 120,
                    child: CountryCodePicker(
                      alignLeft: true,
                      favorite: const ["in", "aus", "nz"],
                      onChanged: (CountryCode code) {
                        provider.changeCountryCode(code);
                      },
                      initialSelection: "in",
                      backgroundColor: Colors.black,
                      enabled: true,
                      showCountryOnly: true,
                      barrierColor: Colors.grey,
                      boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          hintText: "Enter mobile number",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: AppColors.appBarColor, width: 1.5))),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonTitle: "Print Number",
              voidCallback: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "${provider.countryCode}" "${textController.text}",
                  ),
                  backgroundColor: Colors.green,
                ));
                debugPrint(
                    "${provider.countryCode.code}" "${textController.text}");

                Fluttertoast.showToast(
                    msg: "${provider.countryCode.dialCode.toString()}"
                        "${textController.text}");
                textController.clear();
              },
              color: Colors.green,
            ),
          ],
        );
      }),
    );
  }
}
