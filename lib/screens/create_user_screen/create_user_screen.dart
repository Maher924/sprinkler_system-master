import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/create_user_screen/local_widgets/gender_option_card.dart';
import 'package:sprinkler_system/screens/home_screen/home_screen.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/widgets/text_input.dart';

import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';

class CreateUserScreen extends StatelessWidget {
  static const String routeName = '/create-user';

  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: UtilValues.scrollPhysics,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: ColorsPalette.primarySwatch,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.gap32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    GenderOptionCard(gender: Gender.male),
                    Gaps.gap16,
                    GenderOptionCard(gender: Gender.female),
                  ],
                ),
                Gaps.gap32,
                const TextInput(
                  hint: 'First Name',
                  inputType: TextInputType.name,
                ),
                Gaps.gap16,
                const TextInput(
                  hint: 'Last Name',
                  inputType: TextInputType.name,
                ),
                Gaps.gap16,
                const TextInput(
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                Gaps.gap16,
                const TextInput(
                  hint: 'Phone Number',
                  inputType: TextInputType.phone,
                ),
                Gaps.gap16,
                const TextInput(
                  hint: 'Password',
                  inputType: TextInputType.visiblePassword,
                ),
                Gaps.gap16,
                const TextInput(
                  hint: 'Confirm Password',
                  inputType: TextInputType.visiblePassword,
                ),
                Gaps.gap32,
                PrimaryButton(
                  label: 'Create User',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
