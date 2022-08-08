import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/routes/get_application_routes.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utilitis/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(systemBarLight);

  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ebloqs',
        theme: ThemeData(fontFamily: 'Archivo'),
        initialRoute: HomeScreen.routeName,
        routes: getApplicationRoutes(),
      ),
    );
  }
}
