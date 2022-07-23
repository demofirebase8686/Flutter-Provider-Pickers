import 'package:flutter/material.dart';

import 'package:providers_pickers/Views/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback voidCallback;
  Color? color;
  CustomButton({
    Key? key,
    required this.buttonTitle,
    required this.voidCallback,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: voidCallback,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(size.width - 100, size.height * 0.060),
            primary: color ?? AppColors.appBarColor,
            onPrimary: Colors.white,
            alignment: Alignment.center,
            elevation: 5.0,
            enableFeedback: true,
            padding: const EdgeInsets.all(20.0)),
        child: Text(
          buttonTitle,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
