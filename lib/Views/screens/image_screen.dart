import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../View_Models/images/multiImage.dart';
import '../../View_Models/images/singleimage.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Widget> tabChildernss = const [SingleImageScreen(), MultiImageScreen()];
  @override
  void initState() {
    controller = TabController(length: tabChildernss.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Image Picker Provider"),
            bottom: TabBar(
                indicatorPadding: const EdgeInsets.symmetric(vertical: 10.0),
                dragStartBehavior: DragStartBehavior.down,
                automaticIndicatorColorAdjustment: true,
                physics: const NeverScrollableScrollPhysics(),
                unselectedLabelColor: Colors.grey,
                controller: controller,
                enableFeedback: true,
                indicatorColor: Colors.white,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    text: "Single Picker",
                  ),
                  Tab(
                    text: "Multiple Image Pickers",
                  )
                ]),
          ),
          body: TabBarView(
            controller: controller,
            children: tabChildernss,
          )),
    );
  }
}
