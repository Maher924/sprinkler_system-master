import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/gaps.dart';

import '../../utils/colors_palette.dart';
import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/logout_button.dart';
import 'local_widgets/report_table_cell.dart';

class ReportScreen extends StatelessWidget {
  static const String routeName = '/report';

  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tableColumnWidths = {
      0: const FlexColumnWidth(3),
      1: const FlexColumnWidth(3),
      2: const FlexColumnWidth(2),
      3: const FlexColumnWidth(2),
      4: const FlexColumnWidth(2),
    };
    return Column(
      children: [
        const CustomAppBar(
          title: 'Reports',
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
                  Text(
                    'Last 30 days',
                    style: TextStyle(
                      color: ColorsPalette.primarySwatch.shade900,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.gap24,
                  Table(
                    columnWidths: tableColumnWidths,
                    border: TableBorder.all(
                      color: ColorsPalette.primarySwatch.shade900,
                    ),
                    children: [
                      const TableRow(
                        children: [
                          ReportTableCell(
                            value: 'Sprinklers',
                            color: ColorsPalette.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          ReportTableCell(
                            value: 'Date',
                            color: ColorsPalette.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          ReportTableCell(
                            value: 'Start',
                            color: ColorsPalette.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          ReportTableCell(
                            value: 'End',
                            color: ColorsPalette.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          ReportTableCell(
                            value: 'Status',
                            color: ColorsPalette.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      _buildTableRow(date: '5/11/2022'),
                      _buildTableRow(withEmpty: true),
                      _buildTableRow(withEmpty: true),
                    ],
                  ),
                  Gaps.gap32,
                  Table(
                    columnWidths: tableColumnWidths,
                    border: TableBorder.all(
                      color: ColorsPalette.primarySwatch.shade900,
                    ),
                    children: [
                      _buildTableRow(date: '5/12/2022'),
                      _buildTableRow(withEmpty: true),
                      _buildTableRow(withEmpty: true),
                    ],
                  ),
                  Gaps.gap32,
                  Table(
                    columnWidths: tableColumnWidths,
                    border: TableBorder.all(
                      color: ColorsPalette.primarySwatch.shade900,
                    ),
                    children: [
                      _buildTableRow(date: '5/13/2022'),
                      _buildTableRow(withEmpty: true),
                      _buildTableRow(withEmpty: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow({String? date, bool withEmpty = false}) {
    return TableRow(
      children: [
        ReportTableCell(
          value: withEmpty ? '' : 'Activated in',
          color: ColorsPalette.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        ReportTableCell(value: withEmpty ? '' : date!),
        const ReportTableCell(value: '6 AM'),
        const ReportTableCell(value: '7 AM'),
        const ReportTableCell(value: 'Auto'),
      ],
    );
  }
}
