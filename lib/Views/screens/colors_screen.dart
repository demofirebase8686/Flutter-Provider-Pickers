import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/View_Models/color_provider.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

class ColorsPickerScreen extends StatelessWidget {
  const ColorsPickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomColorProvider>(builder: (context, provider, _) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: provider.color,
        appBar: AppBar(
          backgroundColor: provider.color,
          title: const Text("Colors Pickers Provider"),
          centerTitle: true,
        ),
        body: Center(
            child: CustomButton(
                buttonTitle: "pick color",
                color: provider.color,
                voidCallback: () {
                  showDialog(
                      context: context,
                      builder: (c) {
                        return AlertDialog(
                          title: const Text("Pick a color"),
                          content: SingleChildScrollView(
                              child: BlockPicker(
                            onColorChanged: (Color newColor) {
                              provider.colorChangeFunction(newColor);
                            },
                            pickerColor: provider.color,
                            // useInShowDialog: true,
                          )),
                        );
                      });
                })),
      ));
    });
  }
}
