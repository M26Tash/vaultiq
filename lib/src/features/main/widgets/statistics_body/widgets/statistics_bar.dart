// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class StatisticsBar extends StatefulWidget {
  final List<FlSpot> incomeSpots;
  final List<FlSpot> expenseSpots;
  const StatisticsBar({
    required this.incomeSpots,
    required this.expenseSpots,
    super.key,
  });

  @override
  State<StatisticsBar> createState() => _StatisticsBarState();
}

class _StatisticsBarState extends State<StatisticsBar> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekDates = List.generate(7, (i) {
      return DateTime(now.year, now.month, now.day)
          .subtract(Duration(days: 6 - i));
    });

    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          border: Border.all(
            color: context.theme.cardBackgroundColor,
          ),
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index > 6) return const SizedBox.shrink();

                final date = weekDates[index];
                final label = DateFormat.E().format(date);
                return Text(
                  label,
                  style: context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.bodyTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1000,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                String formattedValue;
                if (value >= 1000) {
                  formattedValue = '${(value / 1000).toStringAsFixed(1)}k';
                } else {
                  formattedValue = value.toStringAsFixed(0);
                }

                return Text(
                  formattedValue,
                  style: context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.bodyTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
            ),
          ),
        ),
        maxX: 6,
        lineBarsData: [
          LineChartBarData(
            spots: widget.incomeSpots,
            isCurved: true,
            color: context.theme.primaryGreenColor,
            belowBarData: BarAreaData(
              color: context.theme.accentGreenColor.withOpacity(.2),
              show: true,
            ),
            dotData: const FlDotData(
              show: false,
            ),
          ),
          LineChartBarData(
            spots: widget.expenseSpots,
            isCurved: true,
            color: context.theme.primaryRedColor,
            belowBarData: BarAreaData(
              color: context.theme.accentRedColor.withOpacity(.2),
              show: true,
            ),
            dotData: const FlDotData(
              show: false,
            ),
          ),
        ],
      ),
    );
  }
}
