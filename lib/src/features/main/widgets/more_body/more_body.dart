import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'More',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.bodyTextColor,
            fontWeight: AppFonts.weightMedium,
          ),
        ),
      ],
    );
  }
}
