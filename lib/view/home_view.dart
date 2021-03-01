import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_upload/controller/home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home View"),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => controller.selectedImagePath.value == ''
                          ? Text(
                              "Select image from camera/gallery",
                              style: TextStyle(fontSize: 20),
                            )
                          : Expanded(
                              child: Image.file(
                                  File(controller.selectedImagePath.value)),
                            ),
                    ),
                    SizedBox(height: 10),
                    Obx(() => Text(controller.selectedImageSize.value == ''
                        ? ''
                        : controller.selectedImageSize.value)),
                    RaisedButton(
                      onPressed: () {
                        controller.getImage(ImageSource.camera);
                      },
                      child: Text("Camera"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        controller.getImage(ImageSource.gallery);
                      },
                      child: Text("Galeria"),
                    ),
                    SizedBox(height: 10),
                    Obx(() => controller.selectedImagePath.value == ''
                        ? _saveButton(onPressed: null)
                        : _saveButton(onPressed: controller.uploadFiles)),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _saveButton({Function onPressed}) {
    return RaisedButton(
        color: Colors.pink,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text("Save"));
  }
}
