import 'package:camera/camera.dart';
import 'package:ebloqs_app/src/providers/account_info_provider.dart';
import 'package:ebloqs_app/src/providers/apple_sign_in_available.dart';
import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/providers/coin_market_provider.dart';
import 'package:ebloqs_app/src/providers/images_provider.dart';
import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/providers/qr_info_provider.dart';
import 'package:ebloqs_app/src/providers/transfer_current_provider.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/routes/get_application_routes.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:ebloqs_app/src/services/apple_signin_service.dart';
import 'package:ebloqs_app/src/services/coin_market_cap_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> _cameras;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(systemBarDark);
  await Firebase.initializeApp();
  await Preferences.init();
  _cameras = await availableCameras();
  // var locationProvider = LocationsProvider();
  // locationProvider.useMyLocation();
  Provider.debugCheckInvalidValueType = null;
  final appleSignInAvailable = await AppleSignInAvailable.check();
  runApp(Provider<AppleSignInAvailable>.value(
    value: appleSignInAvailable,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 100));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    String? isoCountryCode = systemLocales.first.countryCode;
    print(isoCountryCode);
    return MultiProvider(
      providers: [
        //USER
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider(create: (context) => AccountInfoProvider()),
        ChangeNotifierProvider(create: (context) => AuthAppleService()),
        //Location
        ChangeNotifierProvider(create: (context) => LocationsProvider()),
        //CoinMarketCap
        ChangeNotifierProvider(create: (context) => CoinMarketCapService()),
        //Images
        ChangeNotifierProvider(create: (context) => ImagesProvider()),
        //QR
        ChangeNotifierProvider(create: (context) => QrInfoProvider()),
        //AVATAR
        ChangeNotifierProvider(create: (context) => AvatarUserProvider()),
        ChangeNotifierProvider(create: (context) => TransferCurrentProvider()),
        //COINMARKET
        ChangeNotifierProvider(create: (context) => CoinMarketProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ebloqs',
        theme: ThemeData(
            fontFamily: 'Archivo', scaffoldBackgroundColor: Colors.white),
        initialRoute: OnBoardPageRoute.routeName,
        routes: getApplicationRoutes(),
      ),
    );
  }
}
