import 'package:ebloqs_app/src/screens/onBoard/on_board_3_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_redes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboard2Screen extends StatelessWidget {
  const Onboard2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff170658),
      body: Stack(
        children: [
          Image.asset(
            'assets/png/onboard2.png',
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
                      child: const Text(
                        'Salir',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 15,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegistroRedesScreen.routeName, (route) => false);
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
              width: size.width * 0.79,
              height: size.height * 0.162,
              child: const Text(
                '''Se dueño de tokens que
representan una
propiedad o servicio.''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 25,
                  fontFamily: "Archivo",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.56,
            left: size.width * 0.078,
            child: const Text(
              '02',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 14,
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
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.582,
            left: size.width * 0.15,
            child: const Text(
              '05',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.836,
            child: SizedBox(
              height: size.height * 0.06,
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
              right: size.width * 0.074,
              child: GestureDetector(
                child: SvgPicture.asset(
                  alignment: Alignment.topCenter,
                  'assets/Vectores/Iconos/Frame.svg',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Onboard3Screen(),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
