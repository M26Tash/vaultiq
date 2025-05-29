import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: context.theme.primaryColor,
    );
  }
}
