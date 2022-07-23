import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:providers_pickers/Utils/utils.dart';
import 'package:providers_pickers/View_Models/images/fullscreen_image.dart';
import 'package:providers_pickers/View_Models/images/image_provider.dart';
import 'package:providers_pickers/Views/widgets/custom_button.dart';

class SingleImageScreen extends StatelessWidget {
  const SingleImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<CustomImageProvider>(
        builder: ((context, provider, child) => SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.040,
                        ),
                        provider.imageFile != null
                            ? Hero(
                                tag: DateTime.now().toString(),
                                child: GestureDetector(
                                  onTap: () {
                                    Utils.navigateToPage(
                                        context,
                                        FullScreenImage(
                                            herotag: DateTime.now().toString(),
                                            imageFile: File(
                                                provider.imageFile!.path)));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.file(
                                      provider.imageFile!,
                                      fit: BoxFit.cover,
                                      height: size.height * 0.400,
                                      width: size.width - 100,
                                    ),
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                    "https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg"),
                              ),
                        SizedBox(
                          height: size.height * 0.040,
                        ),
                        CustomButton(
                            buttonTitle: "Pick from Camera",
                            voidCallback: () {
                              provider.pickImage(ImageSource.camera);
                            }),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        CustomButton(
                            buttonTitle: "Pick from Gallery",
                            voidCallback: () {
                              provider.pickImage(ImageSource.gallery);
                            }),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        CustomButton(
                            buttonTitle: "Clear Image",
                            color: Colors.red,
                            voidCallback: () {
                              provider.clearImage();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
