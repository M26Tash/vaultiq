import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class StatisticsBar extends StatelessWidget {
  const StatisticsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: context.themeData.textTheme.headlineSmall?.copyWith(
          color: context.theme.bodyTextColor,
          fontWeight: AppFonts.weightMedium,
        ),
      ),
      primaryYAxis: const NumericAxis(
        majorGridLines: MajorGridLines(
          width: 0,
        ),
        minimum: 0,
        maximum: 40,
        interval: 10,
      ),
      plotAreaBorderColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      series: <CartesianSeries<MockBarData, String>>[
        ColumnSeries<MockBarData, String>(
          dataSource: data,
          xValueMapper: (MockBarData data, _) => data.day,
          yValueMapper: (MockBarData data, _) => data.income,
          name: 'Income',
          color: Colors.purple,
        ),
        ColumnSeries<MockBarData, String>(
          dataSource: data,
          xValueMapper: (MockBarData data, _) => data.day,
          yValueMapper: (MockBarData data, _) => data.expense,
          name: 'Expense',
          color: Colors.blueAccent,
        ),
        ColumnSeries<MockBarData, String>(
          dataSource: data,
          xValueMapper: (MockBarData data, _) => data.day,
          yValueMapper: (MockBarData data, _) => data.balance,
          name: 'Balance',
          color: Colors.deepOrange,
        ),
      ],
    );
  }
}

final data = <MockBarData>[
  MockBarData('Mon', 15, 9, 15 - 9),
  MockBarData('Tue', 10, 2, 10 - 2),
  MockBarData('Wed', 12, 5, 12 - 5),
  MockBarData('Thu', 8, 1, 8 - 1),
  MockBarData('Fri', 18, 12, 18 - 12),
  MockBarData('Sat', 7, 1, 7 - 1),
  MockBarData('San', 13, 20, 13 - 20),
];

class MockBarData {
  MockBarData(
    this.day,
    this.income,
    this.expense,
    this.balance,
  );

  final String day;
  final double income;
  final double expense;
  final double balance;
}
