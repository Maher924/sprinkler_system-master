import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/home_screen/home_screen.dart';
import 'package:sprinkler_system/screens/login_screen/login_screen.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';
import 'package:sprinkler_system/utils/gaps.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _splashOperation(context),
        builder: (context, _) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsManager.sprinkler,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'Sprinkler System',
                  style: TextStyle(
                    color: ColorsPalette.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _splashOperation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }
}
