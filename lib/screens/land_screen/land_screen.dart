import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/widgets/custom_card.dart';

import '../../utils/colors_palette.dart';
import '../../utils/sprinklers_id.dart';
import '../../utils/user_id.dart';
import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/garden_card.dart';
import 'local_widgets/sprinkler_item.dart';

class LandScreen extends StatefulWidget {
  static String routeName = '/land';

  LandScreen({Key? key}) : super(key: key);
  @override
  State<LandScreen> createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  @override
  Widget build(BuildContext context) {
    final sprinklerStatus = context.read<UserID>().sprinklerStatus;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Front Garden',
        actions: [
          Row(
            children: [
              const Text(
                'Auto',
                style: TextStyle(
                  color: ColorsPalette.primaryColor,
                ),
              ),
              Transform.scale(
                scale: 0.75,
                child: CupertinoSwitch(
                  value: sprinklerStatus['auto'],
                  trackColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      if (sprinklerStatus['auto'] == false) {
                        for (int i = 0; i < 6; i++) sprinklerStatus['$i'] = true;
                      }
                      sprinklerStatus['auto'] = value;
                      context.read<UserID>().push_sprinkler_data();
                      value = !value;
                    });
                  },
                  activeColor: ColorsPalette.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: UtilValues.scrollPhysics,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const GardenCard(heroTag: 'garden'),
              Gaps.gap24,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sprinklers',
                  style: TextStyle(
                    color: ColorsPalette.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gaps.gap24,
              CustomCard(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        for (int i = 0; i < 6; i++)
                          SprinklerItem(
                            i: i,
                            CallBack: (value) {
                              print(value);
                              setState(() {
                                sprinklerStatus['$i'] = value;
                                value = !value;
                                context.read<UserID>().push_sprinkler_data();
                              });
                            },
                          ),
                      ],
                    ),
                    if (sprinklerStatus['auto'])
                      Stack(children: [
                        Container(
                          color: Color(0xa0d6d6d6),
                          width: 400,
                          height: 230,
                        )
                      ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
