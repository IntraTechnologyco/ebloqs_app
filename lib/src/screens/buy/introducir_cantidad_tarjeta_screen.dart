import 'package:ebloqs_app/src/screens/buy/congrats_screen.dart';
import 'package:ebloqs_app/src/services/transfer_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroducirCantidadTarjetaScreen extends StatefulWidget {
  static const String routeName = 'IntroducirCantidadTarjetaScreen';
  final String? cantidadTarjeta;
  const IntroducirCantidadTarjetaScreen({Key? key, this.cantidadTarjeta})
      : super(key: key);

  @override
  State<IntroducirCantidadTarjetaScreen> createState() =>
      _IntroducirCantidadTarjetaScreenState();
}

class _IntroducirCantidadTarjetaScreenState
    extends State<IntroducirCantidadTarjetaScreen> {
  final GlobalKey<FormState> formKey7 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey8 = GlobalKey<FormState>();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  final int _current = 0;
  double comision = 50.00;
  double? cantidad;
  double? recibes;
  double total = 0.0;
  @override
  void initState() {
    quantityController.text = widget.cantidadTarjeta!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.cantidadTarjeta!.isNotEmpty &&
        quantityController.text == widget.cantidadTarjeta) {
      cantidad = double.parse(widget.cantidadTarjeta!);
      recibes = cantidad;
      print(cantidad);
      print(recibes);
    }
    if (recibes != null) {
      total = recibes! / 0.05;
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * (27 / size.height),
            left: size.width * (16 / size.width),
            right: size.width * (16 / size.width),
          ),
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
                    "Introduce la cantidad",
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
                padding: EdgeInsets.only(
                  top: size.height * (32 / size.height),
                ),
                child: const Text(
                  "Cantidad",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (8 / size.height),
                ),
                child: Form(
                  key: formKey7,
                  child: TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 1,
                            height: size.height * (32 / size.height),
                            color: const Color(0xffCDCCD1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * (10 / size.width),
                              right: size.width * (19 / size.width),
                            ),
                            child: const Text(
                              "USD",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 14,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      labelStyle: const TextStyle(
                        color: Color(0xff9B99A3),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          cantidad = double.parse(value);
                          recibes = cantidad;
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (39 / size.height),
                ),
                child: const Text(
                  "Recibes:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (6 / size.height),
                ),
                child: Row(
                  children: [
                    Text(
                      recibes.toString(),
                      style: const TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      " USD",
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
                padding: EdgeInsets.only(
                  top: size.height * (19 / size.height),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Método de transacción:",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "VISA",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (14 / size.height),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Comisión transacción:",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${comision.toString()} USD",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (48 / size.height),
                ),
                child: Container(
                  width: size.width,
                  height: size.height * (416 / size.height),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffccc6dc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 13, bottom: 31, left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Añadir información de la cuenta.",
                              style: TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/X.svg'),
                              onTap: () {},
                            )
                          ],
                        ),
                        Form(
                          key: formKey8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.0257142857142857),
                                child: const Text(
                                  "Nombre en Tarjeta",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.00985221674876847),
                                child: TextFormField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Color(0xff9B99A3),
                                      fontSize: 14,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.0197044334975369),
                                child: const Text(
                                  "Nombre del Banco",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.00985221674876847),
                                child: TextFormField(
                                  controller: bankNameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Color(0xff9B99A3),
                                      fontSize: 14,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.0197044334975369),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.4,
                                      height: size.height * 0.0995221674876847,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "F. Vencimiento",
                                            style: TextStyle(
                                              color: Color(0xff170658),
                                              fontSize: 13,
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    0.00985221674876847),
                                            child: TextFormField(
                                              controller:
                                                  expirationDateController,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: InputDecoration(
                                                labelStyle: const TextStyle(
                                                  color: Color(0xff9B99A3),
                                                  fontSize: 14,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.4,
                                      height: size.height * 0.0995221674876847,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "CVV",
                                            style: TextStyle(
                                              color: Color(0xff170658),
                                              fontSize: 13,
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    0.00985221674876847),
                                            child: TextFormField(
                                              controller: cvvController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                labelStyle: const TextStyle(
                                                  color: Color(0xff9B99A3),
                                                  fontSize: 14,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.0640394088669951,
                ),
                child: GestureDetector(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: size.height * 0.0640394088669951,
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
                          "Continuar",
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
                  onTap: () async {
                    try {
                      final response = await TransferService().transfer(
                          to: Preferences.id_wallet!,
                          amount: quantityController.text);
                      if (response.isNotEmpty) {
                        debugPrint(response.toString());
                        Future.delayed(Duration.zero)
                            .then((_) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CongratsScreen(
                                          total: total,
                                        ))));
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
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
