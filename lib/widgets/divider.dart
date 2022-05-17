import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsManager.divider);
  }
}
