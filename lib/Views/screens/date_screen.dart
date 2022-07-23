import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/View_Models/date_provider.dart';

import 'package:providers_pickers/Views/colors/app_colors.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<CustomDateProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text("Date Picker Provider"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 20,
            ),
            const headerText(text: "Simple Date Pickers"),
            const SizedBox(
              height: 40.0,
            ),
            //* current date text
            Center(
              child: Text(
                DateFormat.yMMMd().format(provider.currentDate),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            //* date picker button
            CustomButton(
                buttonTitle: "Date Picker",
                voidCallback: () => provider.pickDateFunction(context)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.white,
                height: 10,
              ),
            ),
            const headerText(text: "Calender Date Picker :"),
            const SizedBox(
              height: 20.0,
            ),
            //* calender show date text
            Text(
              DateFormat.yMMMMEEEEd().format(provider.currentDate),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            //* calender date picker function
            Container(
              height: 400,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CalendarDatePicker(
                firstDate: provider.firstDate,
                lastDate: provider.lastDate,
                initialDate: DateTime(2022),
                onDateChanged: (DateTime datetime) {
                  provider.onDateChangedFunction(datetime);
                },
                currentDate: provider.currentDate,
                initialCalendarMode: DatePickerMode.day,
              ),
            )
          ],
        )),
      );
    }));
  }
}

class headerText extends StatelessWidget {
  final String text;
  const headerText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.white,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
