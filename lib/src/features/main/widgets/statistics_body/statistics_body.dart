import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/features/main/widgets/statistics_body/widgets/statistics_bar.dart';
import 'package:vaultiq/src/features/main/widgets/statistics_body/widgets/statistics_scrollable_sheet.dart';

class StatisticsBody extends StatefulWidget {
  const StatisticsBody({super.key});

  @override
  State<StatisticsBody> createState() => _StatisticsBodyState();
}

class _StatisticsBodyState extends State<StatisticsBody> {
  late final DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    super.initState();

    _draggableScrollableController = DraggableScrollableController();
  }

  @override
  void dispose() {
    super.dispose();

    _draggableScrollableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(AppDimensions.large),
          children: [
            const SizedBox(height: AppDimensions.extraLarge),
            Container(
              color: context.theme.transparent,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: const StatisticsBar(),
            ),
          ],
        ),
        DraggableScrollableSheet(
          controller: _draggableScrollableController,
          builder: (context, scrollController) {
            return StatisticsScrollableSheet(
              scrollController: scrollController,
            );
          },
        ),
      ],
    );
  }
}
