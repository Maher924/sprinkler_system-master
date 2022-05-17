import 'package:flutter/material.dart';

import '../utils/colors_palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
     this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: ColorsPalette.primaryColor),
      title:title != null? Text(
        title!,
        style: const TextStyle(
          color: ColorsPalette.primaryColor,
        ),
      ) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
