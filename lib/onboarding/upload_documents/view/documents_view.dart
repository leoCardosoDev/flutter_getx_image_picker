import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_upload/onboarding/upload_documents/controller/home_controller.dart';
import 'package:getx_upload/onboarding/upload_documents/view/steps_explanation_view.dart';

class DocumentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Theme.of(context).primaryColor;

    List<int> values = [0, 1, 2];

    List<String> titles = [
      'Selfie',
      'Documento com foto',
      'Comprovante de residência'
    ];

    List<Image> iconsInactive = [
      Image.asset('images/ic_upload/icon_selfie_inativo@2x.png'),
      Image.asset('images/ic_upload/icon_documentos_inativo@2x.png'),
      Image.asset('images/ic_upload/icon_comprovante_inativo@2x.png'),
    ];

    List<Image> iconsActive = [
      Image.asset('images/ic_upload/icon_selfie_ativo.png'),
      Image.asset('images/ic_upload/icon_documentos_ativo@2x.png'),
      Image.asset('images/ic_upload/icon_comprovante_ativo@2x.png'),
    ];

    Widget _iconCircle({int index, HomeController controller, Color color}) {
      return Obx(() => controller.allSteps[index].value == false
          ? Icon(
              controller.nextStep[index].value == true
                  ? FontAwesomeIcons.solidCircle
                  : FontAwesomeIcons.circle,
              size: 35,
              color: color,
            )
          : Icon(
              controller.nextStep[index].value == true
                  ? FontAwesomeIcons.solidCheckCircle
                  : FontAwesomeIcons.circle,
              size: 35,
              color: color,
            ));
    }

    Widget _verticalDivider({Color color}) {
      return VerticalDivider(
        color: color,
        thickness: 2,
        width: 20,
      );
    }

    _buildTopicTitle({String text}) {
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 3),
        child: Text(
          text,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Open-sans-regular',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: const Color(0xff1f272f),
          ),
        ),
      );
    }

    Widget _buildProgress(
        {String title, int index, int value, HomeController controller}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Container(
                    height: 55,
                    width: 55,
                    child: Obx(() => controller.allSteps[index].value == false
                        ? iconsInactive[index]
                        : iconsActive[index]),
                  ),
                ),
              ),
              index == values.length - 1
                  ? Container()
                  : Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Container(),
                    ),
            ],
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildTopicTitle(text: title),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Obx(
                () => controller.allSteps[index].value == false
                    ? _iconCircle(
                        index: index,
                        controller: controller,
                        color: Colors.grey)
                    : _iconCircle(
                        index: index,
                        controller: controller,
                        color: Color(0xFF0CB3FF)),
              ),
              index == values.length - 1
                  ? Container()
                  : Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Obx(() => controller.allSteps[index].value == false
                          ? _verticalDivider(color: Colors.grey)
                          : _verticalDivider(color: Color(0xFF0CB3FF))),
                    ),
            ],
          ),
        ],
      );
    }

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Passo 7 de 8",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 1,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: _primaryColor,
                        maxRadius: 12,
                        child: Container(
                          child: Text(
                            '7',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Documentos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                      'Precisamos que você tire uma selfie e nos envie uma foto ou cópia digitalizada dos documentos:'),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                        itemCount: values.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildProgress(
                              title: '${titles[values[index]]}',
                              index: index,
                              value: values[index],
                              controller: controller);
                        }),
                  ),
                  Container(
                    width: double.infinity,
                    height: 85,
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(() => SelfieExplanationView());
                      },
                      color: _primaryColor,
                      child: Text("Começar"),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          );
        });
  }
}
