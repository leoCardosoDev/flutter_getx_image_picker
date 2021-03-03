import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:getx_upload/onboarding/upload_documents/controller/home_controller.dart';

class SelfieChooseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text(
                "Selfie",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.only(top: 30),
                color: Colors.black87,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => controller.selectedImagePath.value == ''
                          ? Expanded(
                              child: Text(
                                "Selecionar imagem da camera ou galeria: ",
                                style: TextStyle(fontSize: 20),
                              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          color: Colors.transparent,
                          onPressed: () {
                            controller.getImage(ImageSource.camera);
                          },
                          child:
                              Obx(() => controller.selectedImagePath.value == ''
                                  ? Container(
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.circle,
                                        size: 55,
                                        color: Colors.grey[50],
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(10),
                                      color: Colors.grey[50],
                                      child: Text(
                                        "Tirar outra selfie",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )),
                        ),
                        SizedBox(height: 10),
                        Obx(() => controller.selectedImagePath.value == ''
                            ? Container()
                            : _saveButton(
                                context: context,
                                onPressed: controller.uploadFiles)),
                      ],
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _saveButton({BuildContext context, Function onPressed}) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text("Confirmar")),
    );
  }
}
