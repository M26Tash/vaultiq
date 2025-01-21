import 'dart:ui';

import 'package:equatable/equatable.dart';

// final class VaultiqTheme extends Equatable {
//   final bool isDark;

//   final Color backgroundColor;
//   final Color cardBackgroundColor;
//   final Color overlayBackgroundColor;

//   final Color primaryColor;
//   final Color accentColor;
//   final Color highlightColor;
//   final Color backgroundAccentColor;

//   final Color primaryAccent;
//   final Color secondaryAccentColor;

//   final Color transparent;

//   final Color primaryIconColor;
//   final Color secondaryIconColor;

//   final Color bodyTextColor;
//   final Color subTextColor;
//   final Color hintTextColor;
//   final Color labelTextColor;
//   final Color highlightTextColor;
//   final Color lightTextColor;

//   final Color black;

//   final String fontFamily;

//   final Brightness statusBarTheme;
//   final Brightness navigationBarBrightness;

//   @override
//   List<Object?> get props => [
//         isDark,
//         backgroundColor,
//         cardBackgroundColor,
//         overlayBackgroundColor,
//         primaryColor,
//         accentColor,
//         highlightColor,
//         backgroundAccentColor,
//         primaryAccent,
//         secondaryAccentColor,
//         primaryIconColor,
//         secondaryIconColor,
//         transparent,
//         bodyTextColor,
//         subTextColor,
//         hintTextColor,
//         labelTextColor,
//         highlightTextColor,
//         lightTextColor,
//         black,
//         fontFamily,
//         statusBarTheme,
//         navigationBarBrightness,
//       ];

//   const VaultiqTheme({
//     required this.isDark,
//     required this.backgroundColor,
//     required this.cardBackgroundColor,
//     required this.overlayBackgroundColor,
//     required this.primaryColor,
//     required this.accentColor,
//     required this.highlightColor,
//     required this.backgroundAccentColor,
//     required this.primaryAccent,
//     required this.secondaryAccentColor,
//     required this.primaryIconColor,
//     required this.secondaryIconColor,
//     required this.transparent,
//     required this.bodyTextColor,
//     required this.subTextColor,
//     required this.hintTextColor,
//     required this.labelTextColor,
//     required this.highlightTextColor,
//     required this.lightTextColor,
//     required this.black,
//     required this.fontFamily,
//     required this.statusBarTheme,
//     required this.navigationBarBrightness,
//   });
// }

final class VaultiqTheme extends Equatable {
  final bool isDark;

  final Color backgroundColor;
  final Color cardBackgroundColor;
  final Color overlayBackgroundColor;

  final Color primaryColor;
  final Color accentColor;
  final Color highlightColor;
  final Color backgroundAccentColor;

  final Color primaryAccentColor;
  final Color secondaryAccentColor;

  final Color primaryGreenColor;
  final Color accentGreenColor;
  final Color primaryRedColor;
  final Color accentRedColor;

  final Color transparent;

  final Color primaryIconColor;
  final Color secondaryIconColor;

  final Color bodyTextColor;
  final Color subTextColor;
  final Color hintTextColor;
  final Color labelTextColor;
  final Color highlightTextColor;
  final Color lightTextColor;

  final Color black;

  final String fontFamily;

  final Brightness statusBarTheme;
  final Brightness navigationBarBrightness;

  @override
  List<Object?> get props => [
        isDark,
        backgroundColor,
        cardBackgroundColor,
        overlayBackgroundColor,
        primaryColor,
        accentColor,
        highlightColor,
        backgroundAccentColor,
        primaryAccentColor,
        secondaryAccentColor,
        primaryGreenColor,
        accentGreenColor,
        primaryRedColor,
        accentRedColor,
        primaryIconColor,
        secondaryIconColor,
        transparent,
        bodyTextColor,
        subTextColor,
        hintTextColor,
        labelTextColor,
        highlightTextColor,
        lightTextColor,
        black,
        fontFamily,
        statusBarTheme,
        navigationBarBrightness,
      ];

  const VaultiqTheme({
    required this.isDark,
    required this.backgroundColor,
    required this.cardBackgroundColor,
    required this.overlayBackgroundColor,
    required this.primaryColor,
    required this.accentColor,
    required this.highlightColor,
    required this.backgroundAccentColor,
    required this.primaryAccentColor,
    required this.secondaryAccentColor,
    required this.primaryGreenColor,
    required this.accentGreenColor,
    required this.primaryRedColor,
    required this.accentRedColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.transparent,
    required this.bodyTextColor,
    required this.subTextColor,
    required this.hintTextColor,
    required this.labelTextColor,
    required this.highlightTextColor,
    required this.lightTextColor,
    required this.black,
    required this.fontFamily,
    required this.statusBarTheme,
    required this.navigationBarBrightness,
  });
}
