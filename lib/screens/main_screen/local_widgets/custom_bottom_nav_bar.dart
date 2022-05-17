import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/main_screen/local_widgets/custom_bottom_nav_bar/local_widgets/bottom_nav_bar_item.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';

import '../../../utils/colors_palette.dart';
import '../../../utils/gaps.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int) onChanged;

  const CustomBottomNavBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 240,
                color: ColorsPalette.darkBackgroundColor,
                child: Row(
                  children: [
                    BottomNavBarItem(
                      label: 'Profile',
                      image: AssetsManager.maleAvatar,
                      onTap: () => onChanged(0),
                    ),
                    const Spacer(),
                    BottomNavBarItem(
                      label: 'Report',
                      image: AssetsManager.report,
                      onTap: () => onChanged(2),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: CircleAvatar(
                radius: 36,
                backgroundColor: ColorsPalette.lightBackgroundColor,
                child: Material(
                  shape: const CircleBorder(),
                  color: ColorsPalette.darkBackgroundColor,
                  child: InkWell(
                    onTap: () => onChanged(1),
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.home_rounded,
                            color: ColorsPalette.primaryColor,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
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
              ),
            )
          ],
        ),
        Gaps.gap16,
      ],
    );
  }
}
