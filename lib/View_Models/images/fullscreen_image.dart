import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final File imageFile;
  final String herotag;
  const FullScreenImage({
    Key? key,
    required this.herotag,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Hero(
        tag: herotag,
        child: InteractiveViewer(
          child: Image.file(imageFile,
              fit: BoxFit.cover, height: 400, width: double.infinity),
        ),
      ),
    );
  }
}
