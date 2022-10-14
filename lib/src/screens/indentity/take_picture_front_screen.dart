import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:ebloqs_app/src/camera/camera_overlay.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/models/camera_models.dart';
import 'package:ebloqs_app/src/screens/indentity/verification_front_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakePictureFront extends StatefulWidget {
  static const routeName = 'TakePictureFront';
  const TakePictureFront({Key? key}) : super(key: key);

  @override
  State<TakePictureFront> createState() => _TakePictureFrontState();
}

class _TakePictureFrontState extends State<TakePictureFront> {
  OverlayFormat format = OverlayFormat.cardID1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: size.width * 0.139720558882236,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarLight,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.0359342915811089),
            child: SvgPicture.asset(
              'assets/Vectores/Iconos/Arrow left.svg',
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
        ),
        title: const AutoSizeText(
          "Documento de identidad",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "Archivo",
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<CameraDescription>?>(
            future: availableCameras(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null || snapshot.data.isEmpty) {
                  return const Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'No camera found',
                        style: TextStyle(color: Colors.white),
                      ));
                }
                return CameraOverlay(
                    snapshot.data!.first,
                    CardOverlay.byFormat(format),
                    (XFile file) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VerificationFrontScreen(file: file))));
              } else {
                return const Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'Obteniendo Camara',
                      style: TextStyle(color: Colors.black),
                    ));
              }
            },
          ),
          Positioned(
            top: UtilSize.height(530, context),
            left: size.width * 0.0359342915811089,
            child: const AutoSizeText(
              "Lado frontal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: UtilSize.height(550, context),
            left: size.width * 0.0359342915811089,
            child: const AutoSizeText(
              "Muestra tu documento de identidad del lado frontal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
