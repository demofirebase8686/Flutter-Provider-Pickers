import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/View_Models/time_provider.dart';
import 'package:providers_pickers/Views/screens/date_screen.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

class TimePickerScreen extends StatelessWidget {
  const TimePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Time Picker Provider"),
        centerTitle: true,
      ),
      body: Consumer<CustomTimeProvider>(builder: (context, provider, _) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headerText(text: provider.currentTime.format(context)),
              CustomButton(
                  buttonTitle: "Time Picker",
                  voidCallback: () => provider.pickTimeFunction(context)),
            ],
          ),
        );
      }),
    ));
  }
}
