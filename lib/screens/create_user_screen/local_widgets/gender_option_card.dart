import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';

import '../../../utils/colors_palette.dart';

enum Gender { male, female }

class GenderOptionCard extends StatelessWidget {
  final Gender gender;

  const GenderOptionCard({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: ColorsPalette.backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Image.asset(
          gender == Gender.male ? AssetsManager.maleAvatar : AssetsManager.femaleAvatar,
          fit: BoxFit.contain,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
