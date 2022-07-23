import 'package:flutter/material.dart';

class FilePickerScreen extends StatelessWidget {
  const FilePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("File Picker Provider"),
        centerTitle: true,
      ),
      body: Container(color: Colors.yellow),
    ));
  }
}
