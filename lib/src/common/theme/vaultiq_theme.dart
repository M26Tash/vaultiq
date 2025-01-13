import 'dart:ui';

import 'package:equatable/equatable.dart';

final class VaultiqTheme extends Equatable {
  final bool isDark;

  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final Color tertiaryBackgroundColor;

  final Color mainAppColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;

  final Color primaryAccent;
  final Color secondaryAccent;

  final Color transparent;

  final Color defaultIconColor;
  final Color secondaryIconColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color quaternaryTextColor;
  final Color fivefoldTextColor;
  final Color whiteTextColor;

  final Color blackColor;

  final String fontFamily;

  final Brightness statusBarBrightness;
  final Brightness navigationBarBrightness;

  @override
  List<Object?> get props => [
        isDark,
        primaryBackgroundColor,
        secondaryBackgroundColor,
        tertiaryBackgroundColor,
        mainAppColor,
        secondaryColor,
        tertiaryColor,
        quaternaryColor,
        primaryAccent,
        secondaryAccent,
        defaultIconColor,
        secondaryIconColor,
        transparent,
        primaryTextColor,
        secondaryTextColor,
        tertiaryTextColor,
        quaternaryTextColor,
        fivefoldTextColor,
        whiteTextColor,
        blackColor,
        fontFamily,
        statusBarBrightness,
        navigationBarBrightness,
      ];

  const VaultiqTheme({
    required this.isDark,
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.tertiaryBackgroundColor,
    required this.mainAppColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.primaryAccent,
    required this.secondaryAccent,
    required this.defaultIconColor,
    required this.secondaryIconColor,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.quaternaryTextColor,
    required this.fivefoldTextColor,
    required this.whiteTextColor,
    required this.blackColor,
    required this.fontFamily,
    required this.statusBarBrightness,
    required this.navigationBarBrightness,
  });
}
