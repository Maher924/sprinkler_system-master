import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/login_screen/login_screen.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      },
      icon: const Icon(
        Icons.exit_to_app,
        color: ColorsPalette.red,
      ),
      label: const Text(
        'Logout',
        style: TextStyle(
          color: ColorsPalette.red,
        ),
      ),
    );
  }
}
