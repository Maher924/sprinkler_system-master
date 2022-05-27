import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprinkler_system/screens/create_user_screen/create_user_screen.dart';
import 'package:sprinkler_system/screens/home_screen/home_screen.dart';
import 'package:sprinkler_system/screens/land_screen/land_screen.dart';
import 'package:sprinkler_system/screens/loading_location_screen/loading.dart';
import 'package:sprinkler_system/screens/login_screen/login_screen.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/screens/profile_screen/profile_screen.dart';
import 'package:sprinkler_system/screens/report_screen/report_screen.dart';
import 'package:sprinkler_system/screens/splash_screen/splash_screen.dart';
import 'package:sprinkler_system/screens/users_screen/users_screen.dart';
import 'package:sprinkler_system/utils/user_id.dart';

import 'utils/colors_palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserID())],
      child: MaterialApp(
        title: 'Sprinkler System',
        theme: ThemeData(
          primarySwatch: ColorsPalette.primarySwatch,
          canvasColor: ColorsPalette.lightBackgroundColor,
          backgroundColor: ColorsPalette.lightBackgroundColor,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => SplashScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          MainScreen.routeName: (_) => MainScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          LandScreen.routeName: (_) => LandScreen(),
          ProfileScreen.routeName: (_) => ProfileScreen(),
          ReportScreen.routeName: (_) => ReportScreen(),
          UsersScreen.routeName: (_) => UsersScreen(),
          CreateUserScreen.routeName: (_) => CreateUserScreen(),
          'Loading': (context) => Loading(),
        },
      ),
    );
  }
}
