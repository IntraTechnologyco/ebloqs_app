import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransferirEbloqsScreen extends StatefulWidget {
  static const routeName = 'TransferirEbloqsScreen';
  const TransferirEbloqsScreen({Key? key}) : super(key: key);

  @override
  State<TransferirEbloqsScreen> createState() => _TransferirEbloqsScreenState();
}

class _TransferirEbloqsScreenState extends State<TransferirEbloqsScreen> {
  @override
  Widget build(BuildContext context) {
    String cuenta = '307714257896005';
    String subCuenta = cuenta.substring(0, 4);

    String subCuenta2 = cuenta.substring(cuenta.length - 4);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 27, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Arrow left.svg'),
                    onTap: () {},
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Transferir a la cuenta ebloqs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 17,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Question.svg')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "USD",
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "50.00",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: 340,
                  child: Text(
                    "Transfiere tus fondos  a la cuenta que indica a continuación desde tu cuenta bancaria: $subCuenta*******$subCuenta2",
                    style: const TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 53.0),
                child: Text(
                  "Datos de la cuenta bancaria Ebloqs",
                  style: TextStyle(
                    color: Color(0xff2504ca),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: 343,
                  height: 64,
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 19, bottom: 10, left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffeae4fc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Nº De referencia",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "FI99HL7B",
                            style: TextStyle(
                              color: Color(0xff2504ca),
                              fontSize: 20,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Copy 2.svg'),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: 341,
                  child: Text(
                    "Incluye tu código de referencia en los comentarios: La transacción sin código, o un código incorrecto será rechazada.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "Nombre del Beneficiario de la cuenta",
                  style: TextStyle(
                    color: Color(0xff92959e),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  "Key Vision Development",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Número de cuenta del beneficiario",
                  style: TextStyle(
                    color: Color(0xff92959e),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  "1504546221",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Dirección de Beneficiario",
                  style: TextStyle(
                    color: Color(0xff92959e),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  "1504546221",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Código SWITF",
                  style: TextStyle(
                    color: Color(0xff92959e),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  "SIGNNIIS33XXX",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Nombre del Banco receptor",
                  style: TextStyle(
                    color: Color(0xff92959e),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  "Signature Bank",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Dirección del Banco receptor",
                  style: TextStyle(
                    color: Color(0xff92959e),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  "565 Fith Avenue New York ",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 42.0, bottom: 60),
                child: GestureDetector(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/png/buttongradient.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Terminar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, WalletScreen.routeName, (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}