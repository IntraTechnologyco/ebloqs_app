import 'package:after_layout/after_layout.dart';
import 'package:ebloqs_app/src/app/app_config.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/screens/settings/settings_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/services/balance_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  Environment? environment;
  @override
  void afterFirstLayout(BuildContext context) async {
    var userInfo =
        await AuthUserService().getUserInfo(accesstoken: Preferences.token!);
    Future.delayed(Duration.zero).then((_) =>
        Provider.of<UserInfoProvider>(context, listen: false)
            .userInfoSet(userInfo));
    setState(() {
      environment = AppConfig.of(context).environment;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarSelected = Provider.of<AvatarUserProvider>(context).avatarUser;
    bool isLoading = false;
    print('token: ${Preferences.token}');
    List<Map<String, dynamic>> inversiones = [
      {
        'imagen': 'assets/Imagenes/heraldica.png',
        'inversion': 'Heráldica',
        'sector':
            'Sector González Suárez, pasaje Juan Pareja y Jiménez de la Espada.',
        'precio': '500',
        'pisos': '6',
        'rentabilidad': '31,5'
      },
    ];
    List<Map<String, dynamic>> inversionesQuito = [
      {
        'imagen': 'assets/Imagenes/quito1.png',
        'inversion': 'Heráldica',
        'sector': 'Av . Gonzalez Suarez y Av. Pinzon. Es 94',
        'precio': '100',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '13.25'
      },
      {
        'imagen': 'assets/Imagenes/quito2.png',
        'inversion': 'Dinámica II',
        'sector': 'Av. Diego Almagro y Av. Alpallana',
        'precio': '120',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '12.01'
      },
      {
        'imagen': 'assets/Imagenes/quito1.png',
        'inversion': 'Heráldica',
        'sector': 'Av . Gonzalez Suarez y Av. Pinzon. Es 94',
        'precio': '100',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '13.25'
      },
      {
        'imagen': 'assets/Imagenes/quito2.png',
        'inversion': 'Dinámica II',
        'sector': 'Av. Diego Almagro y Av. Alpallana',
        'precio': '120',
        'pisos': '15',
        'apartamentos': '80',
        'rentabilidad': '12.01'
      },
    ];
    List<Map<String, dynamic>> inversionesMiami = [
      {
        'imagen': 'assets/Imagenes/guayaquil1.png',
        'inversion': 'SOHO 500 Smart',
        'sector': '1569 NW 17th Ave.',
        'precio': '300',
        'pisos': '25',
        'apartamentos': '120',
        'rentabilidad': '29.75'
      },
      {
        'imagen': 'assets/Imagenes/guayaquil2.png',
        'inversion': 'Ocean Beach',
        'sector': '551 N Fort Lauderdale Beach Blvd R2403',
        'precio': '103',
        'pisos': '21',
        'apartamentos': '105',
        'rentabilidad': '28.05'
      },
      {
        'imagen': 'assets/Imagenes/guayaquil1.png',
        'inversion': 'SOHO 500 Smart',
        'sector': '1569 NW 17th Ave.',
        'precio': '300',
        'pisos': '25',
        'apartamentos': '120',
        'rentabilidad': '29.75'
      },
      {
        'imagen': 'assets/Imagenes/guayaquil2.png',
        'inversion': 'Ocean Beach',
        'sector': '551 N Fort Lauderdale Beach Blvd R2403',
        'precio': '103',
        'pisos': '21',
        'apartamentos': '105',
        'rentabilidad': '28.05'
      },
    ];
    List<Map<String, dynamic>> inversionesVehiculos = [
      {
        'imagen': 'assets/Imagenes/vehiculo1.png',
        'inversion': 'Jeep Wrangler 2017',
        'ratio': '4.91',
        'trips': '81',
        'star': 'All Star Host',
        'precio': '120',
      },
      {
        'imagen': 'assets/Imagenes/vehiculo2.png',
        'inversion': 'Jeep Wrangler 2017',
        'ratio': '4.91',
        'trips': '81',
        'star': 'All Star Host',
        'precio': '120',
      },
    ];
    List<Map<String, dynamic>> inversionesEducacion = [
      {
        'imagen': 'assets/Imagenes/university-library-4825366_1920.jpg',
        'inversion': 'UNAH Universidad MX',
        'oferta': 'Oferta educativa',
      },
      {
        'imagen': 'assets/Imagenes/educativa1.png',
        'inversion': 'TEC CR México Norte',
        'oferta': 'Oferta educativa',
      },
    ];
    List<Map<String, dynamic>> inversionesEventos = [
      {
        'imagen': 'assets/Imagenes/rock-3079352_640.jpg',
        'inversion': 'Inversión concierto',
        'oferta': 'Inversiones eventos',
      },
      {
        'imagen': 'assets/Imagenes/belgium-6497401_1920.jpg',
        'inversion': 'Inversión evento',
        'oferta': 'Inversiones eventos',
      },
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   systemOverlayStyle: systemBarDark,
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.035, vertical: size.height * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: UtilSize.width(36, context),
                      height: UtilSize.width(36, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: UtilSize.width(1, context),
                        ),
                        color: const Color(0xffeae4fc),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            (avatarSelected == null || avatarSelected.isEmpty)
                                ? SvgPicture.asset(
                                    'assets/avatares/mascota/pet-4.svg',
                                    width: size.width * 0.067,
                                  )
                                : SvgPicture.asset(
                                    avatarSelected,
                                    width: size.width * 0.067,
                                  ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                  SizedBox(
                    width: size.width * 0.68,
                    height: size.height * 0.047,
                    child: OutlineSearchBar(
                      borderRadius: BorderRadius.circular(100),
                      borderColor: const Color(0xffeae4fc),
                      searchButtonIconColor: const Color(0xff170658),
                      hideSearchButton: true,
                      hintText: 'Buscar Inversiones',
                      hintStyle: TextStyle(
                        color: const Color(0xff170658),
                        fontSize: UtilSize.width(13, context),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/Vectores/Iconos/Bell.svg',
                      width: size.width * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              ImageSlideshow(

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 3000,

                  /// Loops back to first slide.
                  isLoop: true,

                  /// The color to paint the indicator.
                  indicatorColor: Colors.transparent,

                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.transparent,
                  height: size.height * 0.3,
                  children: [
                    //tarjeta 1
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.03),
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.1,
                        padding: EdgeInsets.only(
                            top: size.height * 0.0197044334975369,
                            left: size.width * 0.04,
                            right: size.width * 0.032),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/Imagenes/Mask group.png'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.0369458128078818,
                                left: size.width * 0.04,
                              ),
                              child: SizedBox(
                                width: size.width * 0.432,
                                child: Text(
                                  "Invierte en bienes y servicios tokenizados ¡con tarjeta! ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: UtilSize.width(15, context),
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Image.asset(
                                'assets/Vectores/Ilustraciones/Group 2189.png',
                                width: UtilSize.width(359, context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //tarjeta 2
                    (Preferences.public_key != null)
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: UtilSize.height(15, context),
                                bottom: size.height * 0.03),
                            child: FutureBuilder(
                              future: BalanceService().getBalanceOf(
                                  accesstoken: Preferences.token!,
                                  publicKey: Preferences.public_key!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData && snapshot.data != null) {
                                  print(snapshot.data);
                                  final usd =
                                      double.parse(snapshot.data) * 0.05;
                                  return GestureDetector(
                                    child: Container(
                                      width: size.width * 0.95,
                                      height: UtilSize.height(812, context),
                                      padding: EdgeInsets.only(
                                          top: UtilSize.height(18, context),
                                          left: size.width * 0.043,
                                          right: size.width * 0.034),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/Imagenes/Mask group.png'),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: UtilSize.height(
                                                        12, context)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color:
                                                        const Color(0x14ffffff),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 4,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: UtilSize.width(
                                                            16, context),
                                                        height: UtilSize.width(
                                                            16, context),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: SvgPicture.asset(
                                                          'assets/Vectores/Iconos/candado.svg',
                                                          color: Colors.white,
                                                          width: UtilSize.width(
                                                              16, context),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: UtilSize.width(
                                                              8, context)),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Balance Bloqueado ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: UtilSize
                                                                  .width(11,
                                                                      context),
                                                              fontFamily:
                                                                  "Archivo",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            snapshot.data ?? '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: UtilSize
                                                                  .width(11,
                                                                      context),
                                                              fontFamily:
                                                                  "Archivo",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            ' EBL',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: UtilSize
                                                                  .width(11,
                                                                      context),
                                                              fontFamily:
                                                                  "Archivo",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: size.height *
                                                        0.00985221674876847,
                                                    left: size.width *
                                                        0.0106666666666667),
                                                child: Text(
                                                  "BALANCE DISPONIBLE",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: UtilSize.width(
                                                        11.59, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: size.height * 0.015),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      snapshot.data ?? '',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 36,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.035),
                                                    Text(
                                                      "EBL",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            UtilSize.width(
                                                                18.55, context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: size.height * 0.015),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color:
                                                        const Color(0xff170658),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.033,
                                                    vertical:
                                                        size.height * 0.01,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "$usd USD",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              UtilSize.width(
                                                                  13, context),
                                                          fontFamily: "Archivo",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: size.height * 0.022),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: UtilSize.height(
                                                          12, context)),
                                                  child: Container(
                                                    width: size.width * 0.15,
                                                    height: size.width * 0.15,
                                                    padding: EdgeInsets.all(
                                                        size.width * 0.02),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Colors.white
                                                              .withOpacity(0.7),
                                                          const Color(
                                                              0x00ffffff)
                                                        ],
                                                      ),
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/Vectores/Iconos/ebloqscoinb.svg',
                                                      width: UtilSize.width(
                                                          20, context),
                                                    ),
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  'assets/Vectores/Iconos/chevronright.svg',
                                                  width: UtilSize.width(
                                                      24, context),
                                                  color:
                                                      const Color(0xffffffff),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, WalletScreen.routeName);
                                    },
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.02,
                                bottom: size.height * 0.03),
                            child: GestureDetector(
                              child: Container(
                                width: size.width * 0.95,
                                height: size.height * 0.1,
                                padding: EdgeInsets.only(
                                    top: size.height * 0.0184729064039409,
                                    left: size.width * 0.043,
                                    right: size.width * 0.034),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/Imagenes/Mask group.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color(0x14ffffff),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                UtilSize.width(4, context),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width:
                                                    UtilSize.width(16, context),
                                                height:
                                                    UtilSize.width(16, context),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/Vectores/Iconos/candado.svg',
                                                  color: Colors.white,
                                                  width: UtilSize.width(
                                                      16, context),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Balance Bloqueado ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: UtilSize.width(
                                                          11, context),
                                                      fontFamily: "Archivo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '0',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: UtilSize.width(
                                                          11, context),
                                                      fontFamily: "Archivo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' EBL',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: UtilSize.width(
                                                          11, context),
                                                      fontFamily: "Archivo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height *
                                                  0.00985221674876847,
                                              left: size.width *
                                                  0.0106666666666667),
                                          child: Text(
                                            "BALANCE DISPONIBLE",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: UtilSize.width(
                                                  11.59, context),
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.015),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '0',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: UtilSize.width(
                                                      36, context),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.035),
                                              Text(
                                                "EBL",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: UtilSize.width(
                                                      18.55, context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.015),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color(0xff170658),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.033,
                                              vertical: size.height * 0.01,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "0 USD",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: UtilSize.width(
                                                        13, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: size.height * 0.022),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: size.width * 0.15,
                                            height: size.width * 0.15,
                                            padding: EdgeInsets.all(
                                                size.width * 0.02),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.white.withOpacity(0.7),
                                                  const Color(0x00ffffff)
                                                ],
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                                'assets/Vectores/Iconos/ebloqscoinb.svg',
                                                width: UtilSize.width(
                                                    20, context)),
                                          ),
                                          SvgPicture.asset(
                                            'assets/Vectores/Iconos/chevronright.svg',
                                            width: UtilSize.width(24, context),
                                            color: const Color(0xffffffff),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                customModalBottomAlert(
                                    context,
                                    size,
                                    'La opción de billetera se habilitará en la etapa 2',
                                    isLoading,
                                    '', () {
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                    //tarjeta 3
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.03),
                      child: (environment == Environment.prod)
                          ? Container(
                              width: size.width * 0.9,
                              height: size.height * 0.1,
                              padding: EdgeInsets.only(
                                  top: size.height * 0.03,
                                  left: size.width * 0.04,
                                  right: size.width * 0.032),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/Imagenes/Mask group.png'),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.006,
                                            left: size.width * 0.11),
                                        child: Image.asset(
                                          'assets/Imagenes/Group 2066.png',
                                          width: size.width * 0.2,
                                          height: size.height * 0.09,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.027),
                                        child: Text(
                                          "INVIERTE EN TOKENS EBLOQS",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                UtilSize.width(10, context),
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: size.height * 0.022),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.025,
                                              right: size.width * 0.05),
                                          child: Text(
                                            "Ronda privada",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: UtilSize.width(
                                                  11.59, context),
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: size.width * 0.04),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(126.47),
                                              color: const Color(0xff170658),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.04,
                                              vertical: size.width * 0.03,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "\$0,07 USD",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: UtilSize.width(
                                                        16.44, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: size.width * 0.025),
                                          child: SvgPicture.asset(
                                            'assets/Vectores/Iconos/chevronright.svg',
                                            color: const Color(0xffffffff),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : GestureDetector(
                              child: Container(
                                width: size.width * 0.9,
                                height: size.height * 0.1,
                                padding: EdgeInsets.only(
                                    top: size.height * 0.03,
                                    left: size.width * 0.04,
                                    right: size.width * 0.032),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/Imagenes/Mask group.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.006,
                                              left: size.width * 0.11),
                                          child: Image.asset(
                                            'assets/Imagenes/Group 2066.png',
                                            width: size.width * 0.2,
                                            height: size.height * 0.09,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.027),
                                          child: Text(
                                            "INVIERTE EN TOKENS EBLOQS",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  UtilSize.width(10, context),
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: size.height * 0.022),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.025,
                                                right: size.width * 0.05),
                                            child: Text(
                                              "Ronda privada",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: UtilSize.width(
                                                    11.59, context),
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: size.width * 0.04),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        126.47),
                                                color: const Color(0xff170658),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.04,
                                                vertical: size.width * 0.03,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "\$0,07 USD",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: UtilSize.width(
                                                          16.44, context),
                                                      fontFamily: "Archivo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: size.width * 0.025),
                                            child: SvgPicture.asset(
                                              'assets/Vectores/Iconos/chevronright.svg',
                                              color: const Color(0xffffffff),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ComprarScreen.routeName);
                              },
                            ),
                    )
                  ]),
              //Banner

              // Inversión destacadas
              Text(
                "Inversión Destacadas",
                style: TextStyle(
                  color: const Color(0xff170658),
                  fontSize: UtilSize.width(15, context),
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: SizedBox(
                  width: UtilSize.width(337, context),
                  height: UtilSize.height(500, context),
                  child: ListView.builder(
                    itemCount: inversiones.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          child: Container(
                            width: UtilSize.width(337, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 0.88,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 17.62,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(inversiones[index]['imagen'],
                                        width: UtilSize.width(375, context)),
                                    Positioned(
                                        top: size.height * 0.015,
                                        right: size.width * 0.03,
                                        child: SvgPicture.asset(
                                          'assets/Vectores/Iconos/Hearth.svg',
                                          width: UtilSize.width(30, context),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.017,
                                      left: size.width * 0.032,
                                      right: size.width * 0.032),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            inversiones[index]['inversion'],
                                            style: TextStyle(
                                              color: const Color(0xff170658),
                                              fontSize:
                                                  UtilSize.width(15, context),
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.37,
                                            child: Text(
                                              inversiones[index]['sector'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: const Color(0xff170658),
                                                fontSize:
                                                    UtilSize.width(13, context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        width: size.width * 0.4,
                                        height: UtilSize.height(54, context),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.025,
                                            vertical: size.height * 0.009),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.40),
                                          color: const Color(0xfff9f9fa),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Precio x Token \$${inversiones[index]['precio']}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xff2504ca),
                                                fontSize:
                                                    UtilSize.width(11, context),
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "1 Token",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(0xff170658),
                                                fontSize:
                                                    UtilSize.width(13, context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.032,
                                      vertical: size.height * 0.015),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.001,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.032,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Building.svg',
                                        width: UtilSize.width(16, context),
                                      ),
                                      Text(
                                        "${inversiones[index]['pisos']} Pisos ",
                                        style: TextStyle(
                                          color: const Color(0xff170658),
                                          fontSize: UtilSize.width(12, context),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Plus.svg',
                                        width: UtilSize.width(16, context),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.032,
                                      vertical: size.height * 0.015),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.001,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.032,
                                  ),
                                  child: Text(
                                    "Rentabilidad acumulada promedio ${inversiones[index]['rentabilidad']}%",
                                    style: TextStyle(
                                        fontSize: UtilSize.width(12, context),
                                        color: const Color(0xff170658)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.032,
                                      vertical: size.height * 0.0152),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.001,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.height * 0.04,
                                      left: size.width * 0.032,
                                      right: size.width * 0.032),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.2,
                                        height: UtilSize.height(35, context),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: size.width * 0.065,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/avatares/2x/profile-1-2x.png',
                                                width:
                                                    UtilSize.width(24, context),
                                              ),
                                            ),
                                            Positioned(
                                              left: size.width * 0.045,
                                              child: Container(
                                                width: size.width * 0.065,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/avatares/2x/profile-2-2x.png',
                                                  width: UtilSize.width(
                                                      24, context),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: size.width * 0.09,
                                              child: Container(
                                                width: size.width * 0.065,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/avatares/2x/profile-3-2x.png',
                                                  width: UtilSize.width(
                                                      24, context),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: size.width * 0.13,
                                              child: Container(
                                                width: size.width * 0.065,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/avatares/2x/profile-4-2x.png',
                                                  width: UtilSize.width(
                                                      24, context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.03),
                                        child: SizedBox(
                                          width: size.width * 0.57,
                                          child: Text(
                                            '''+ 100 personas ya compraron
                        tokens en esta propiedad.''',
                                            style: TextStyle(
                                              color: const Color(0xff170658),
                                              fontSize:
                                                  UtilSize.width(12, context),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          customModalBottomAlert(
                              context,
                              size,
                              'La tokenización de bienes y servicios se habilitará en la etapa 2',
                              isLoading,
                              '', () {
                            Navigator.pop(context);
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

              //INVERSIONES CIUDAD QUITO
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.105, bottom: size.height * 0.015),
                child: Text(
                  "Inversiones en Quito",
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(15, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(
                height: UtilSize.height(435, context),
                child: ListView.builder(
                  itemCount: inversionesQuito.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index2) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.04),
                      child: GestureDetector(
                        child: Container(
                          width: size.width * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xffeae4fc),
                              width: 0.88,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0f000000),
                                blurRadius: 17.62,
                                offset: Offset(0, 0),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    inversionesQuito[index2]['imagen'],
                                    width: UtilSize.width(171, context),
                                  ),
                                  Positioned(
                                    top: size.height * 0.008,
                                    right: size.width * 0.015,
                                    child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg',
                                      width: UtilSize.width(30, context),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.012,
                                    bottom: size.height * 0.003,
                                    left: size.width * 0.032,
                                    right: size.width * 0.032),
                                child: Text(
                                  inversionesQuito[index2]['inversion'],
                                  style: TextStyle(
                                    color: const Color(0xff170658),
                                    fontSize: UtilSize.width(14, context),
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.032,
                                    right: size.width * 0.032,
                                    bottom: size.height * 0.01),
                                child: Text(
                                  inversionesQuito[index2]['sector'],
                                  style: TextStyle(
                                    color: const Color(0xff170658),
                                    fontSize: UtilSize.width(12, context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.0098),
                                child: Container(
                                  width: size.width * 0.5,
                                  height: UtilSize.width(52, context),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.007),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.40),
                                    color: const Color(0xfff9f9fa),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Precio token",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: const Color(0xff170658),
                                          fontSize: UtilSize.width(8, context),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "USD\$ ${inversionesQuito[index2]['precio']}",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: const Color(0xff2504ca),
                                              fontSize:
                                                  UtilSize.width(13, context),
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "1 Token",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: const Color(0xff170658),
                                              fontSize:
                                                  UtilSize.width(13, context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.02),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/Vectores/Iconos/Building.svg',
                                      width: UtilSize.width(16, context),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.02),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${inversionesQuito[index2]['pisos']} Pisos ",
                                            style: TextStyle(
                                              color: const Color(0xff170658),
                                              fontSize:
                                                  UtilSize.width(12, context),
                                            ),
                                          ),
                                          Text(
                                            "${inversionesQuito[index2]['apartamentos']} Apartamentos ",
                                            style: TextStyle(
                                              color: const Color(0xff170658),
                                              fontSize:
                                                  UtilSize.width(12, context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg',
                                      width: UtilSize.width(16, context),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.015),
                                child: Center(
                                  child: Container(
                                    height: size.height * 0.001,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff170658),
                                        width: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Rentabilidad",
                                      style: TextStyle(
                                          fontSize: UtilSize.width(12, context),
                                          color: const Color(0xff170658)),
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      "${inversionesQuito[index2]['rentabilidad']}%",
                                      style: TextStyle(
                                          fontSize: UtilSize.width(12, context),
                                          color: const Color(0xff170658)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          customModalBottomAlert(
                              context,
                              size,
                              'La opción de inversiones se habilitará en la etapa 2.',
                              isLoading,
                              '', () {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              // Inversiones ciudad Miami
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.105, bottom: size.height * 0.012),
                child: Text(
                  "Inversiones en Miami",
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(15, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(
                height: UtilSize.height(420, context),
                child: ListView.builder(
                  itemCount: inversionesMiami.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index3) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.045),
                      child: GestureDetector(
                          child: Container(
                            width: size.width * 0.46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 0.88,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 17.62,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      inversionesMiami[index3]['imagen'],
                                      width: UtilSize.width(171, context),
                                    ),
                                    Positioned(
                                      top: size.height * 0.01,
                                      right: size.width * 0.015,
                                      child: SvgPicture.asset(
                                        'assets/Vectores/Iconos/Hearth.svg',
                                        width: UtilSize.width(30, context),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.012,
                                      bottom: size.height * 0.007,
                                      left: size.width * 0.02,
                                      right: size.width * 0.02),
                                  child: Text(
                                    inversionesMiami[index3]['inversion'],
                                    style: TextStyle(
                                      color: const Color(0xff170658),
                                      fontSize: UtilSize.width(14, context),
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: size.width * 0.034,
                                    right: size.width * 0.034,
                                    bottom: size.height * 0.01,
                                  ),
                                  child: Text(
                                    inversionesMiami[index3]['sector'],
                                    style: TextStyle(
                                      color: const Color(0xff170658),
                                      fontSize: UtilSize.width(12, context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: Container(
                                    width: size.width * 0.5,
                                    height: UtilSize.height(52, context),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.025,
                                        vertical: size.height * 0.007),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.40),
                                      color: const Color(0xfff9f9fa),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Precio token",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: const Color(0xff170658),
                                            fontSize:
                                                UtilSize.width(8, context),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "USD\$ ${inversionesMiami[index3]['precio']}",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(0xff2504ca),
                                                fontSize:
                                                    UtilSize.width(13, context),
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "1 Token",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(0xff170658),
                                                fontSize:
                                                    UtilSize.width(13, context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.02),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Building.svg',
                                        width: UtilSize.width(16, context),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.02),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${inversionesMiami[index3]['pisos']} Pisos ",
                                              style: TextStyle(
                                                color: const Color(0xff170658),
                                                fontSize:
                                                    UtilSize.width(12, context),
                                              ),
                                            ),
                                            Text(
                                              "${inversionesMiami[index3]['apartamentos']} Apartamentos ",
                                              style: TextStyle(
                                                color: const Color(0xff170658),
                                                fontSize:
                                                    UtilSize.width(10, context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Plus.svg',
                                        width: UtilSize.width(16, context),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.017),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.002,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rentabilidad",
                                        style: TextStyle(
                                            fontSize:
                                                UtilSize.width(12, context),
                                            color: const Color(0xff170658)),
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        "${inversionesMiami[index3]['rentabilidad']}%",
                                        style: TextStyle(
                                            fontSize:
                                                UtilSize.width(12, context),
                                            color: const Color(0xff170658)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            customModalBottomAlert(
                                context,
                                size,
                                'La opción de inversiones se habilitará en la etapa 2.',
                                isLoading,
                                '', () {
                              Navigator.pop(context);
                            });
                          }),
                    );
                  },
                ),
              ),
              // INVERSION VEHÍCULOS
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.02),
                child: Text(
                  "Inversión vehículos",
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(15, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: UtilSize.height(350, context),
                child: ListView.builder(
                  itemCount: inversionesVehiculos.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index4) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.05),
                      child: GestureDetector(
                          child: Container(
                            width: size.width * 0.74,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.64),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 0.64,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 12.83,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      inversionesVehiculos[index4]['imagen'],
                                      width: UtilSize.width(278.28, context),
                                    ),
                                    Positioned(
                                      top: size.height * 0.01,
                                      right: size.width * 0.01,
                                      child: SvgPicture.asset(
                                        'assets/Vectores/Iconos/Hearth.svg',
                                        width: UtilSize.width(30, context),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.023,
                                    left: size.width * 0.04,
                                  ),
                                  child: Text(
                                    inversionesVehiculos[index4]['inversion'],
                                    style: TextStyle(
                                      color: const Color(0xff170658),
                                      fontSize: UtilSize.width(14.57, context),
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.01,
                                      left: size.width * 0.04,
                                      right: size.width * 0.11),
                                  child: Row(
                                    children: [
                                      Text(
                                        inversionesVehiculos[index4]['ratio'],
                                        style: TextStyle(
                                          color: const Color(0xff170658),
                                          fontSize:
                                              UtilSize.width(10.93, context),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/star-fill1.svg',
                                        width: UtilSize.width(14, context),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: size.width * 0.032,
                                          right: size.width * 0.032,
                                        ),
                                        child: Text(
                                          "(${inversionesVehiculos[index4]['trips']} trips)",
                                          style: TextStyle(
                                            color: const Color(0xff170658),
                                            fontSize:
                                                UtilSize.width(10.93, context),
                                          ),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Award.svg',
                                        width: size.width * 0.035,
                                      ),
                                      Text(
                                        inversionesVehiculos[index4]['star'],
                                        style: TextStyle(
                                          color: const Color(0xff170658),
                                          fontSize:
                                              UtilSize.width(10.93, context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.032,
                                      vertical: size.height * 0.018),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.001,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.width * 0.04,
                                      bottom: size.height * 0.022),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Plus.svg',
                                        width: UtilSize.width(18, context),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.02,
                                            right: size.width * 0.04),
                                        child: Text(
                                          "\$${inversionesVehiculos[index4]['precio']}/day",
                                          style: TextStyle(
                                            color: const Color(0xff2504ca),
                                            fontSize:
                                                UtilSize.width(12.38, context),
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            customModalBottomAlert(
                                context,
                                size,
                                'La opción de inversiones se habilitará en la etapa 2.',
                                isLoading,
                                '', () {
                              Navigator.pop(context);
                            });
                          }),
                    );
                  },
                ),
              ),

              // INVERSION EDUCACIÓN
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.02),
                child: Text(
                  "Inversión educación",
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(15, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: UtilSize.height(305, context),
                child: ListView.builder(
                  itemCount: inversionesEducacion.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index5) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.045),
                      child: GestureDetector(
                          child: Container(
                            width: size.width * 0.74,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.64),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 0.64,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 12.83,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      inversionesEducacion[index5]['imagen'],
                                      width: UtilSize.width(273.67, context),
                                    ),
                                    Positioned(
                                        top: size.height * 0.007,
                                        right: size.width * 0.015,
                                        child: SvgPicture.asset(
                                          'assets/Vectores/Iconos/Hearth.svg',
                                          width: UtilSize.width(30, context),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.023,
                                    left: size.width * 0.04,
                                  ),
                                  child: Text(
                                    inversionesEducacion[index5]['inversion'],
                                    style: TextStyle(
                                      color: const Color(0xff170658),
                                      fontSize: UtilSize.width(14.57, context),
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.018),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.001,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      bottom: size.height * 0.022),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Plus.svg',
                                        width: UtilSize.width(18, context),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.025,
                                            right: size.width * 0.04),
                                        child: Text(
                                          "${inversionesEducacion[index5]['oferta']}",
                                          style: TextStyle(
                                            color: const Color(0xff2504ca),
                                            fontSize:
                                                UtilSize.width(12.38, context),
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            customModalBottomAlert(
                                context,
                                size,
                                'La opción de inversiones se habilitará en la etapa 2.',
                                isLoading,
                                '', () {
                              Navigator.pop(context);
                            });
                          }),
                    );
                  },
                ),
              ),
              //INVERSIÓN EVENTOS
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.02),
                child: Text(
                  "Inversión eventos",
                  style: TextStyle(
                    color: const Color(0xff170658),
                    fontSize: UtilSize.width(15, context),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: UtilSize.height(305, context),
                child: ListView.builder(
                  itemCount: inversionesEventos.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index5) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.045),
                      child: GestureDetector(
                          child: Container(
                            width: size.width * 0.74,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.64),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 0.64,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 12.83,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      inversionesEventos[index5]['imagen'],
                                      width: UtilSize.width(273.67, context),
                                    ),
                                    Positioned(
                                        top: size.height * 0.007,
                                        right: size.width * 0.015,
                                        child: SvgPicture.asset(
                                          'assets/Vectores/Iconos/Hearth.svg',
                                          width: UtilSize.width(30, context),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.023,
                                    left: size.width * 0.04,
                                  ),
                                  child: Text(
                                    inversionesEventos[index5]['inversion'],
                                    style: TextStyle(
                                      color: const Color(0xff170658),
                                      fontSize: UtilSize.width(14.57, context),
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.018),
                                  child: Center(
                                    child: Container(
                                      width: size.width * 0.9,
                                      height: size.height * 0.001,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff170658),
                                          width: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      bottom: size.height * 0.022),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Vectores/Iconos/Plus.svg',
                                        width: UtilSize.width(18, context),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.025,
                                            right: size.width * 0.04),
                                        child: Text(
                                          "${inversionesEventos[index5]['oferta']}",
                                          style: TextStyle(
                                            color: const Color(0xff2504ca),
                                            fontSize:
                                                UtilSize.width(12.38, context),
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            customModalBottomAlert(
                                context,
                                size,
                                'La opción de inversiones se habilitará en la etapa 2.',
                                isLoading,
                                '', () {
                              Navigator.pop(context);
                            });
                          }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
