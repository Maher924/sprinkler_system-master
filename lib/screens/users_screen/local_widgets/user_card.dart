import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/widgets/custom_card.dart';

import '../../../utils/colors_palette.dart';
import '../../../utils/gaps.dart';

class UserCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String phone;
  final String email;
  final VoidCallback? onTap;

  const UserCard({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.email,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      backgroundColor: ColorsPalette.backgroundColor,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageUrl),
          ),
          Gaps.gap24,
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'ID: '),
                  TextSpan(
                    text: id,
                    style: const TextStyle(
                      color: ColorsPalette.primarySwatch,
                    ),
                  ),
                  const TextSpan(text: '\nName: '),
                  TextSpan(
                    text: name,
                    style: const TextStyle(
                      color: ColorsPalette.primarySwatch,
                    ),
                  ),
                  const TextSpan(text: '\nPhone: '),
                  TextSpan(
                    text: phone,
                    style: const TextStyle(
                      color: ColorsPalette.primarySwatch,
                    ),
                  ),
                  const TextSpan(text: '\nEmail: '),
                  TextSpan(
                    text: email,
                    style: const TextStyle(
                      color: ColorsPalette.primarySwatch,
                    ),
                  ),
                ],
                style: TextStyle(
                  color: ColorsPalette.primarySwatch.shade300,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Gaps.gap24,
          Image.asset(
            AssetsManager.active,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
