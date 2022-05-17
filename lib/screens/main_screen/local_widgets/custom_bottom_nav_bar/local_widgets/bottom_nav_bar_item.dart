import 'package:flutter/material.dart';

import '../../../../../utils/colors_palette.dart';
import '../../../../../utils/gaps.dart';

class BottomNavBarItem extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback onTap;

  const BottomNavBarItem({
    Key? key,
    required this.label,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: ColorsPalette.darkBackgroundColor,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  image,
                  height: 20,
                  width: 20,
                ),
                Gaps.gap4,
                Text(
                  label,
                  style: const TextStyle(
                    color: ColorsPalette.primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
