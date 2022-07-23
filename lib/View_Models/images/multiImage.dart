// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/Utils/utils.dart';
import 'package:providers_pickers/View_Models/images/fullscreen_image.dart';
import 'package:providers_pickers/View_Models/images/image_provider.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

class MultiImageScreen extends StatelessWidget {
  const MultiImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CustomImageProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
                buttonTitle: "Select Images",
                voidCallback: () =>
                    provider.getMultipleImages(ImageSource.gallery)),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: AnimationLimiter(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10),
                itemCount: provider.ximageFiles.length,
                itemBuilder: (c, i) {
                  return AnimationConfiguration.staggeredGrid(
                      position: i,
                      columnCount: 4,
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.linear,
                        child: SlideAnimation(
                            horizontalOffset: 50,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.ease,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: provider.imageFiles != null
                                    ? GestureDetector(
                                        onTap: () {
                                          Utils.navigateToPage(
                                              context,
                                              FullScreenImage(
                                                  herotag: provider
                                                      .imageFiles[i]
                                                      .toString(),
                                                  imageFile: File(provider
                                                      .imageFiles[i]!.path)));
                                        },
                                        child: Hero(
                                          tag:
                                              provider.imageFiles[i].toString(),
                                          child: Image.file(File(
                                              provider.imageFiles[i]!.path)),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      ))),
                      ));
                },
              ),
            ))
          ],
        ),
      );
    });
  }
}
