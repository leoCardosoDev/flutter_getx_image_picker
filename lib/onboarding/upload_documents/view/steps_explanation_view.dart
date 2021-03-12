import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_upload/onboarding/upload_documents/controller/home_controller.dart';
import 'package:getx_upload/onboarding/upload_documents/widgets/steps_action_button_widget.dart';
import 'package:getx_upload/onboarding/upload_documents/widgets/steps_explanation_widget.dart';
import 'package:getx_upload/onboarding/upload_documents/widgets/tips_widget.dart';
import 'package:image_picker/image_picker.dart';

class SelfieExplanationView extends StatelessWidget {
  final Color _primaryColor = Color(0xFF0CB3FF);

  final List<Widget> listSelfieTips = [
    TipsWidget(textTips: 'Escolhe um lugar bem iluminado;'),
    TipsWidget(
        textTips:
            'Retire óculos, boné ou qualquer acessório que esconda seu rosto;'),
    TipsWidget(textTips: 'Posicione o celular na altura dos olhos;'),
    TipsWidget(
        textTips: 'Não faça careta ou sorria. Mantenha o rosto relaxado.'),
  ];

  final List<Widget> listDocumentsTips = [
    TipsWidget(textTips: 'Escolhe um lugar bem iluminado;'),
    TipsWidget(textTips: 'Retire o documento do plástico para evitar reflexo;'),
    TipsWidget(textTips: 'Encaixe o documento no molde indicado;'),
    TipsWidget(
        textTips:
            'Confira se as informações estão legíveis antes de confirmar;'),
    TipsWidget(
        textTips:
            'Se preferir, você pode tirar a foto do documento aberto (frente e verso).'),
  ];

  Widget _getImageFromCamera({HomeController controller}) {
    return StepsActionButton(
      onPressed: () {
        controller.getImage(ImageSource.camera);
      },
      color: _primaryColor,
      width: double.infinity,
      height: 45,
      child: Text("Continuar"),
    );
  }

  Widget _actionDocumentButton({HomeController controller}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StepsActionButton(
          onPressed: () {},
          width: 100,
          height: 100,
          padding: EdgeInsets.all(0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(FontAwesomeIcons.photoVideo),
              Text("GALERIA"),
            ],
          ),
        ),
        StepsActionButton(
          onPressed: () {},
          width: 100,
          height: 100,
          padding: EdgeInsets.all(0),
          color: _primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(FontAwesomeIcons.camera),
              Text("CAMERA"),
            ],
          ),
        ),
        StepsActionButton(
          onPressed: () {},
          width: 100,
          height: 100,
          padding: EdgeInsets.all(0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(FontAwesomeIcons.solidFolder),
              Text("ARQUIVOS"),
            ],
          ),
        ),
      ],
    );
  }

  Widget selfieExplanation({HomeController controller}) {
    return StepsExplanationWidgets(
      accentColor: _primaryColor,
      mainIcon: "images/ic_upload/icon_selfie_ativo.png",
      mainTitle: 'Tire uma selfie',
      mainDescription:
          'Precisamos de uma foto do seu rosto para sua identificação e segurança.',
      secondaryTitle: 'Dicas para você tirar uma boa selfie',
      mainTips: listSelfieTips,
      mainButton: _getImageFromCamera(controller: controller),
    );
  }

  Widget documentsExplanation({HomeController controller}) {
    return StepsExplanationWidgets(
      accentColor: _primaryColor,
      mainIcon: "images/ic_upload/icon_documentos_ativo.png",
      mainTitle: 'Agora, precisamos de um documento',
      mainDescription:
          'Você pode nos enviar uma foto ou cópia digitalizada do RG, CNH ou RNE.',
      secondaryTitle: 'Dicas para fotografar seu documento',
      mainTips: listDocumentsTips,
      mainButton: _actionDocumentButton(controller: controller),
    );
  }

  Widget receiptExplanation({HomeController controller}) {
    return StepsExplanationWidgets(
      accentColor: _primaryColor,
      mainIcon: "images/ic_upload/icon_selfie_ativo.png",
      mainTitle: 'Tire uma selfie',
      mainDescription:
          'Precisamos de uma foto do seu rosto para sua identificação e segurança.',
      secondaryTitle: 'Dicas para você tirar uma boa selfie',
      mainTips: listSelfieTips,
      mainButton: Container(),
    );
  }

  Widget _stepsDocumentsUploads({HomeController controller}) {
    if (!controller.allSteps[0].value) {
      return selfieExplanation(controller: controller);
    } else if (!controller.allSteps[1].value) {
      return documentsExplanation(controller: controller);
    } else if (!controller.allSteps[2].value) {
      return receiptExplanation(controller: controller);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            body: _stepsDocumentsUploads(controller: controller),
          );
        });
  }
}
