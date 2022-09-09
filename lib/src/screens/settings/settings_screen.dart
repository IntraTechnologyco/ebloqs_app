import 'package:ebloqs_app/src/screens/settings/avatar_selection_screen.dart';
import 'package:ebloqs_app/src/screens/settings/payments_methods_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'SettingsScreen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0738916256157636,
                  left: size.width * 0.08,
                  right: size.width * 0.08),
              child: GestureDetector(
                  child:
                      SvgPicture.asset('assets/Vectores/Iconos/Arrow left.svg'),
                  onTap: () => Navigator.pop(context)),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0295566502463054,
                  left: size.width * 0.0426666666666667),
              child: Row(
                children: [
                  Image.asset(
                    'assets/Imagenes/avatar.png',
                    width: size.width * 0.157333333333333,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.0453333333333333,
                        right: size.width * 0.221333333333333),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Preferences.userName ?? '',
                          style: const TextStyle(
                            color: Color(0xff170658),
                            fontSize: 15,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "ID: 3578032",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.221333333333333,
                    height: size.height * 0.0369458128078818,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffb9f6ca),
                    ),
                    child: const Center(
                      child: Text(
                        "Verificado",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff00c853),
                          fontSize: 12,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.0221674876847291),
              child: Container(
                width: size.width,
                height: 0.50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffc9d1d1),
                    width: 0.50,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0184729064039409,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomSetting(
                size: size,
                setting: 'Cambiar avatar',
                onTap: () {
                  Navigator.pushNamed(context, AvatarSelectionScreen.routeName);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomSetting(
                size: size,
                setting: 'Métodos de pago',
                onTap: () {
                  Navigator.pushNamed(context, PaymentMethodsScreen.routeName);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomSetting(
                size: size,
                setting: 'Seguridad',
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomSetting(
                size: size,
                setting: 'Ajustes',
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomSetting(
                size: size,
                setting: 'Soporte',
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomSetting(
                size: size,
                setting: 'Siri configuración',
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.172413793103448,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: GestureDetector(
                child: Container(
                  width: size.width,
                  height: size.height * 0.0640394088669951,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xfff6f4fd),
                  ),
                  child: const Center(
                    child: Text(
                      "Cerrar sesión",
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}