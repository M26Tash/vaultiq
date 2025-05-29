import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/features/faq_page/widgets/qa_item.dart';
import 'package:vaultiq/src/features/help_center_page/cubit/help_center_cubit.dart';

@RoutePage()
class FAQPage extends StatelessWidget {
  const FAQPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(AppDimensions.large),
          children: <Widget>[
            if (state.faq.isNotEmpty)
              for (final qa in state.faq)
                QAItem(
                  question: qa!.question,
                  answer: qa.answer,
                ),
          ].insertBetween(
            const SizedBox(
              height: AppDimensions.large,
            ),
          ),
        );
      },
    );
  }
}
