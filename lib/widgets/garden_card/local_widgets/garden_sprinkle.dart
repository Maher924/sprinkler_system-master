import 'package:flutter/material.dart';

import '../../../utils/colors_palette.dart';

class GardenSprinkle extends StatelessWidget {
  final bool isActive;
  final double x;
  final double y;

  const GardenSprinkle({
    Key? key,
    required this.x,
    required this.y,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y,
      left: x,
      child: CircleAvatar(
        radius: 7,
        backgroundColor: isActive ? ColorsPalette.primaryColor : ColorsPalette.red,
      ),
    );
  }
}
