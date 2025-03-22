import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/features/splash_page/cubit/splash_cubit.dart';

class SplashBody extends StatelessWidget {
  final SplashCubit cubit;
  final Color backgroundColor;
  final List<Offset> tracePoints;
  final double buttonPosition;
  final bool animationCompleted;
  final ExchangeModel rates;
  // final String? result;
  // final VoidCallback onTryAgainTap;

  const SplashBody({
    required this.cubit,
    required this.backgroundColor,
    required this.tracePoints,
    required this.buttonPosition,
    required this.animationCompleted,
    required this.rates,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (tracePoints.isNotEmpty)
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: TracePathPainter(tracePoints),
          ),
        if (buttonPosition < 1.0)
          Positioned(
            left: (MediaQuery.of(context).size.width - 80) / 2,
            top: MediaQuery.of(context).size.height * (1.0 - buttonPosition),
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        if (rates.result != null &&
            rates.result != 'success' &&
            animationCompleted == true)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.large),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    context.locale.oops,
                    style: context.themeData.textTheme.displayLarge?.copyWith(
                      color: context.theme.bodyTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    context.locale.somethingWentWrongOnOurEnd,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.labelTextColor,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.extraLarge),
                  CustomButton(
                    buttonText: context.locale.tryAgain,
                    onTap: () {
                      cubit
                        ..clearExchangeRate()
                        ..getExchangeRate();
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class TracePathPainter extends CustomPainter {
  final List<Offset> points;

  TracePathPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final paint = Paint()
      ..color = const Color(0xFF1D1F21)
      ..strokeWidth = 80
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TracePathPainter oldDelegate) => true;
}
