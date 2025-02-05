import 'package:flutter/material.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/bank_card.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BankCardSection(),
      ],
    );
  }
}
