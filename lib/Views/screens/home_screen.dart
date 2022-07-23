import 'package:flutter/material.dart';
import 'package:providers_pickers/Views/screens/colors_screen.dart';
import 'package:providers_pickers/Views/screens/country_screen.dart';
import 'package:providers_pickers/Views/screens/date_screen.dart';
import 'package:providers_pickers/Views/screens/file_screen.dart';
import 'package:providers_pickers/Views/screens/image_screen.dart';
import 'package:providers_pickers/Views/screens/time_screen.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

import '../../Utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Provider Pickers")),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              buttonTitle: "Image Pickers",
              voidCallback: () =>
                  Utils.navigateToPage(context, const ImagePickerScreen()),
            ),
            CustomButton(
                buttonTitle: "Color Pickers",
                voidCallback: () =>
                    Utils.navigateToPage(context, const ColorsPickerScreen())),
            CustomButton(
              buttonTitle: "Country  Pickers",
              voidCallback: () =>
                  Utils.navigateToPage(context, const CountryPickerScreen()),
            ),
            CustomButton(
              buttonTitle: "Date Pickers",
              voidCallback: () =>
                  Utils.navigateToPage(context, const DatePickerScreen()),
            ),
            CustomButton(
                buttonTitle: "Time Pickers",
                voidCallback: () =>
                    Utils.navigateToPage(context, const TimePickerScreen())),
            CustomButton(
                buttonTitle: "File Pickers",
                voidCallback: () =>
                    Utils.navigateToPage(context, const FilePickerScreen())),
          ],
        ),
      )),
    ));
  }
}
