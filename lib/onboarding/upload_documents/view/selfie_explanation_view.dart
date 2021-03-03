import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_upload/onboarding/upload_documents/view/selfie_choose_view.dart';

class SelfieExplanationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Theme.of(context).primaryColor;

    Widget _buildListTile({String text}) {
      return Container(
        padding: EdgeInsets.only(top: 20, bottom: 10, left: 25),
        child: Row(
          children: [
            Icon(Icons.circle, size: 20, color: _primaryColor),
            SizedBox(width: 10),
            Flexible(
                child: Text(
              text,
              style: TextStyle(fontSize: 18),
            )),
          ],
        ),
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
          onPressed: () {
            Get.back();
          },
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
                Icon(
                  Icons.person_outline_outlined,
                  color: _primaryColor,
                  size: 150,
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tire uma selfie',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: _primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          'Precisamos de uma foto do seu rosto para sua identificação e segurança.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  'Dicas para você tirar uma boa selfie',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildListTile(text: 'Escolhe um lugar bem iluminado;'),
                _buildListTile(
                    text:
                        'Retire óculos, boné ou qualquer acessório que esconda seu rosto;'),
                _buildListTile(
                    text: 'Posicione o celular na altura dos olhos;'),
                _buildListTile(
                    text:
                        'Não faça careta ou sorria. Mantenha o rosto relaxado.'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              height: 85,
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {
                  Get.off(SelfieChooseView());
                },
                color: _primaryColor,
                child: Text("Continuar"),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
