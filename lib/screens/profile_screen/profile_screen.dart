import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/gaps.dart';

import '../../utils/colors_palette.dart';
import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/divider.dart';
import '../../widgets/logout_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'My Profile',
            actions: [LogoutButton()],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: UtilValues.scrollPhysics,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage(AssetsManager.cover),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: ColorsPalette.backgroundColor,
                              child: Icon(
                                Icons.camera_alt,
                                color: ColorsPalette.primarySwatch.shade900,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 32,
                          bottom: -45,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                                backgroundColor: ColorsPalette.backgroundColor,
                                child: CircleAvatar(
                                  radius: 41,
                                  backgroundImage: AssetImage(AssetsManager.refaie),
                                ),
                              ),
                              Positioned(
                                right: -5,
                                bottom: 5,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: ColorsPalette.backgroundColor,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: ColorsPalette.primarySwatch.shade900,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox.square(dimension: 45),
                    Gaps.gap24,
                    Text(
                      'Mohamed Refaie',
                      style: TextStyle(
                        color: ColorsPalette.primarySwatch.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gaps.gap4,
                    Text(
                      'ID: 201900823',
                      style: TextStyle(
                        color: ColorsPalette.primarySwatch.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gaps.gap24,
                    const Center(child: CustomDivider()),
                    Gaps.gap24,
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Land Shape: '),
                          TextSpan(
                            text: 'Rectangle\n',
                            style: TextStyle(
                              color: ColorsPalette.primarySwatch.shade300,
                            ),
                          ),
                          const TextSpan(text: 'Land Area: '),
                          TextSpan(
                            text: '250\n',
                            style: TextStyle(
                              color: ColorsPalette.primarySwatch.shade300,
                            ),
                          ),
                          const TextSpan(text: 'Land ID: '),
                          TextSpan(
                            text: '12345\n',
                            style: TextStyle(
                              color: ColorsPalette.primarySwatch.shade300,
                            ),
                          ),
                          const TextSpan(text: 'Sprinklers '),
                          TextSpan(
                            text: '10',
                            style: TextStyle(
                              color: ColorsPalette.primarySwatch.shade300,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          color: ColorsPalette.primarySwatch,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
