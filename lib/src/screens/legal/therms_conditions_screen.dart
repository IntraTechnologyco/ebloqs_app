import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThermsConditionsScreen extends StatefulWidget {
  static const routeName = 'ThermsConditionsScreen';
  const ThermsConditionsScreen({super.key});

  @override
  State<ThermsConditionsScreen> createState() => _ThermsConditionsScreenState();
}

class _ThermsConditionsScreenState extends State<ThermsConditionsScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const AutoSizeText(
            'Términos y condiciones',
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 17,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w700,
            ),
          ),
          leadingWidth: size.width * 0.128,
          leading: Padding(
            padding: EdgeInsets.only(left: size.width * 0.064),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/Vectores/Iconos/Arrow left.svg',
              ),
            ),
          ),
        ),
        body: const WebView(
          initialUrl: 'https://ebloqs.com/ebloqs-token/terminos-y-condiciones',
        )

        //  SingleChildScrollView(
        //     child: Column(
        //   children: [
        //     Container(
        //       width: size.width,
        //       height: 0.50,
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: const Color(0xffc9d1d1),
        //           width: 0.50,
        //         ),
        //       ),
        //     ),
        //     Padding(
        //         padding: EdgeInsets.only(
        //             left: size.width * 0.04,
        //             right: size.width * 0.04,
        //             top: size.height * 0.0357142857142857),
        //         child: Center(
        //           child: AutoSizeText(terminos),
        //         )),
        //   ],
        // )),
        );
  }
}
