import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/sprinklers_id.dart';
import 'package:sprinkler_system/utils/user_id.dart';

import '../../../utils/colors_palette.dart';
import '../../../utils/gaps.dart';
import '../../../widgets/garden_card/local_widgets/garden_sprinkle.dart';


class  SprinklerItem extends StatelessWidget {

  final i;
  final CallBack;
  SprinklerItem({this.i,this.CallBack});
  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    Image.asset(
    AssetsManager.sprinkler,
    width: 30,
    height: 30,
    ),
    Gaps.gap12,
    Text(
    '${UserID.sprinklerData['$i']}',
    style: const TextStyle(
    color: ColorsPalette.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    ),
    ),
    const Spacer(),
    Transform.scale(
    scale: 0.75,
    child: CupertinoSwitch(
    value: UserID.sprinklerStatus['$i'],
onChanged: CallBack,
activeColor: ColorsPalette.primaryColor,
trackColor: Colors.red,
),
),
],
);
  }
}
