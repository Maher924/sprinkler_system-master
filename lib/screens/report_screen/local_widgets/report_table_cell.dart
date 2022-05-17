import 'package:flutter/material.dart';

import '../../../utils/colors_palette.dart';

class ReportTableCell extends StatelessWidget {
  final String value;
  final Color? color;
  final FontWeight fontWeight;

  const ReportTableCell({
    Key? key,
    required this.value,
    this.color,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color ?? ColorsPalette.primarySwatch.shade900,
          fontSize: 12,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
