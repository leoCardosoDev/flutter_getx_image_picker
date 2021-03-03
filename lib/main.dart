import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_upload/onboarding/upload_documents/view/documents_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF0CB3FF)),
      title: 'POC Upload',
      home: DocumentsView(),
    );
  }
}
