import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_upload/onboarding/upload_documents/view/selfie_choose_view.dart';
import 'package:image_picker/image_picker.dart';

import 'package:getx_upload/utils/upload_utils/aws_s3_upload.dart';

class HomeController extends GetxController {
  RxString selectedImagePath = ''.obs;
  RxString selectedImageSize = ''.obs;
  List<RxBool> allSteps = [false.obs, false.obs, false.obs];

  void getImage(ImageSource imageSource) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      Get.off(() => SelfieChooseView());
    }
  }

  Future<void> uploadFiles() async {
    if (selectedImagePath.value != '') {
      String url = await AwsS3.uploadFile(
          accessKey: "XXXXXXXXXXXXXXXXXXXXXXXX",
          secretKey: "XXXXXXXXXXXXXXX",
          file: File(selectedImagePath.value),
          destDir: "xxxxx",
          bucket: "xxxxxxxxx",
          region: "xx-xx-x");

      if (url != "error") {
        allSteps[0].value = true;
        Get.back();
      } else {
        allSteps[0].value = false;
        Get.back();
      }
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
