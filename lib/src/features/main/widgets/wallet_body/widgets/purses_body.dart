import 'package:flutter/material.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/purses_card.dart';

class PursesBody extends StatelessWidget {
  const PursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PursesCardSection(),
      ],
    );
  }
}
