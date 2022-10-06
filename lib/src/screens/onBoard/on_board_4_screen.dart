import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_5_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_redes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboard4Screen extends StatelessWidget {
  const Onboard4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/Imagenes/onboard4.jpg',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.066,
                    left: size.width * 0.087,
                    right: size.width * 0.042),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ebframe.svg',
                      width: 54,
                      height: 45,
                    ),
                    GestureDetector(
                      child: Text(
                        'Salir',
                        style: TextStyle(
                          color: const Color(0xffffffff),
                          fontSize: UtilSize.width(15, context),
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, RegistroRedesScreen.routeName);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.628,
            left: size.width * 0.084,
            child: SizedBox(
              width: UtilSize.width(334, context),
              height: size.height * 0.162,
              child: Text(
                '''Alta rentabilidad, con 
el mejor ratio de dividendos
del mercado.''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xff170658),
                  fontSize: UtilSize.width(22, context),
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.56,
            left: size.width * 0.078,
            child: Text(
              '04',
              style: TextStyle(
                color: const Color(0xff170658),
                fontSize: UtilSize.width(14, context),
                fontFamily: "Archivo",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.58,
            left: size.width * 0.05,
            child: Opacity(
              opacity: 0.35,
              child: Transform.rotate(
                angle: -1.01,
                child: Container(
                  width: 60.21,
                  height: 1,
                  color: const Color(0xff170658),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.582,
            left: size.width * 0.15,
            child: Text(
              '05',
              style: TextStyle(
                color: const Color(0xff170658),
                fontSize: UtilSize.width(14, context),
                fontFamily: "Archivo",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.836,
            child: SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.41,
              child: Stack(
                children: [
                  Positioned(
                    left: size.width * 0.06,
                    child: Container(
                      width: size.width * 0.115,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/avatares/2x/profile-1-2x.png'),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.133,
                    child: Container(
                      width: size.width * 0.115,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/avatares/2x/profile-2-2x.png'),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.21,
                    child: Container(
                      width: size.width * 0.115,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/avatares/2x/profile-3-2x.png'),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.286,
                    child: Container(
                      width: size.width * 0.115,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/avatares/2x/profile-4-2x.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.935,
              left: size.width * 0.074,
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffeae4fc),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0426666666666667),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffeae4fc),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0426666666666667),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffeae4fc),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0426666666666667),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff8966f0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0426666666666667),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffeae4fc),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.533333333333333),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        alignment: Alignment.topCenter,
                        'assets/Vectores/Iconos/Frame.svg',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Onboard5Screen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
