import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class RecentTransfersAndPlan extends StatelessWidget {
  final VoidCallback onGetPlanTap;
  const RecentTransfersAndPlan({
    required this.onGetPlanTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onGetPlanTap,
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.large),
            decoration: BoxDecoration(
              color: context.theme.cardBackgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.large,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: context.theme.overlayBackgroundColor,
                  radius: 24,
                  child: Text(
                    '🤑',
                    style: context.themeData.textTheme.displayMedium,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                Text(
                  context.locale.getPlan,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.bodyTextColor,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.large),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.large),
            decoration: BoxDecoration(
              color: context.theme.transferCardBackgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.large,
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: 157.32 * pi / 180,
                    child: CustomPaint(
                      size: const Size(60, 100),
                      painter: ElongatedNPainter(),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locale.recentTransaction,
                      style:
                          context.themeData.textTheme.headlineMedium?.copyWith(
                        color: context.theme.bodyTextColor,
                        fontWeight: AppFonts.weightRegular,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.preLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 5; i++)
                          CircleAvatar(
                            backgroundColor: context.theme.cardBackgroundColor,
                            child: Text(
                              String.fromCharCode(65 + i),
                              style: context.themeData.textTheme.headlineMedium
                                  ?.copyWith(
                                color: context.theme.bodyTextColor,
                                fontWeight: AppFonts.weightRegular,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ElongatedNPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // ignore: deprecated_member_use
      ..color = Colors.white.withOpacity(.1)
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    final startLeft = Offset(size.width * 0.1, size.height * 0.9);
    final topLeft = Offset(size.width * 0.1, size.height * 0.1);
    final topRight = Offset(size.width * 0.9, size.height * 0.1);
    final bottomRight = Offset(size.width * 0.9, size.height * 0.9);

    canvas
      ..drawLine(startLeft, topLeft, paint)
      ..drawLine(topLeft, bottomRight, paint)
      ..drawLine(topRight, bottomRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
