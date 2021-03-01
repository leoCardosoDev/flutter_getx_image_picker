import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:aws_s3_upload/aws_s3_upload.dart';

class HomeController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void uploadFiles() {
    if (selectedImagePath.value != '') {
      Future<String> url = AwsS3.uploadFile(
          accessKey: "AKIA6I45Q7GAZT73T57F",
          secretKey: "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",
          file: File(selectedImagePath.value),
          destDir: "/uploads/9926",
          bucket: "flutterbucketleo",
          region: "us-east-1");
      print("Retorno do S3 = ${url.toString()}");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
