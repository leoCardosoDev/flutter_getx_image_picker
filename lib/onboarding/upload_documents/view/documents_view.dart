import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_upload/onboarding/upload_documents/view/selfie_explanation_view.dart';

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

    List<Icon> icons = [
      Icon(Icons.backspace),
      Icon(Icons.beenhere),
      Icon(Icons.folder)
    ];

    buildTopicTitle({String text}) {
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

    buildProgress({String title, int index, int value}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: icons[index],
                  ),
                ),
              ),
              index == values.length - 1
                  ? Container()
                  : Container(
                      height: 110,
                      alignment: Alignment.center,
                      child: Container(),
                    ),
            ],
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildTopicTitle(text: title),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.circle,
                size: 40,
                color: Colors.grey,
              ),
              index == values.length - 1
                  ? Container()
                  : Container(
                      height: 90,
                      alignment: Alignment.center,
                      child: VerticalDivider(
                        thickness: 2,
                        width: 20,
                      ),
                    ),
            ],
          ),
        ],
      );
    }

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
                    print("$index");
                    return buildProgress(
                        title: '${titles[values[index]]}',
                        index: index,
                        value: values[index]);
                  }),
            ),
            Container(
              width: double.infinity,
              height: 85,
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {
                  Get.to(SelfieExplanationView(),
                      transition: Transition.fadeIn);
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
  }
}
