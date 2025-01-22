import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class StatisticsBody extends StatelessWidget {
  const StatisticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Statistics',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.bodyTextColor,
            fontWeight: AppFonts.weightMedium,
          ),
        ),
      ],
    );
  }
}
