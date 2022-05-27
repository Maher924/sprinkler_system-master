import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';
import 'package:sprinkler_system/utils/sprinklers_id.dart';

import '../utils/user_id.dart';
import 'custom_card.dart';
import 'garden_card/local_widgets/garden_sprinkle.dart';

class GardenCard extends StatefulWidget {
  final String heroTag;
  final VoidCallback? onTap;

  const GardenCard({
    Key? key,
    required this.heroTag,
    this.onTap,
  }) : super(key: key);

  @override
  State<GardenCard> createState() => _GardenCardState();
}

class _GardenCardState extends State<GardenCard> {
  @override
  Widget build(BuildContext context) {
    final sprinklerStatus = context.watch<UserID>().sprinklerStatus;
    return GestureDetector(
      onTap: widget.onTap,
      child: Hero(
        tag: widget.heroTag,
        child: Stack(
          children: [
            CustomCard(
              child: SizedBox(
                height: 150,
                width: double.infinity,
              ),
            ),
            GardenSprinkle(
              x: 30,
              y: 70,
              isActive: sprinklerStatus['0'],
            ),
            GardenSprinkle(
              x: 80,
              y: 20,
              isActive: sprinklerStatus['1'],
            ),
            GardenSprinkle(
              x: 200,
              y: 130,
              isActive: sprinklerStatus['2'],
            ),
            GardenSprinkle(
              isActive: sprinklerStatus['3'],
              x: 60,
              y: 130,
            ),
            GardenSprinkle(
              isActive: sprinklerStatus['4'],
              x: 250,
              y: 40,
            ),
            GardenSprinkle(
              isActive: sprinklerStatus['5'],
              x: 140,
              y: 80,
            ),
          ],
        ),
      ),
    );
  }
}
