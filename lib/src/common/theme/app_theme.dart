import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/constants/font_family.dart';
import 'package:vaultiq/src/common/theme/vaultiq_theme.dart';

const _black = Color(0xFF000000);
const _orange = Color(0xFFFF6600);
const _royalOrange = Color(0xFFFF983F);
const _lemonYellow = Color(0xFFFFFFA1);
const _cultured = Color(0xFFF5F5F5);
const _philippineGray = Color(0xFF929292);
const _darkJungleGreen = Color(0xFF1D1F21);
const _white = Color(0xFFFFFFFF);
const _outerSpace = Color(0xFF444648);
const _chineseWhite = Color(0xFFE0E0E0);
const _darkCharcoal = Color(0xFF2C2E30);
const _chineseSilver = Color(0xFFCCCCCC);

const _transparent = Color(0x00000000);

const _americanGreen = Color(0xFF28A745);
const _ufoGreen = Color(0xFF34C759);
const _rustyRed = Color(0xFFDC3545);
const _coralRed = Color(0xFFFF3B30);

const _forestGreen = Color(0xFF218838);
const _ufoGreenDark = Color(0xFF2ECC71);
const _cardinal = Color(0xFFC82333);
const _carminePink = Color(0xFFE74C3C);

const _coral = Color(0xFFF97F50);
const _jellyBean = Color(0xFFD86045);

const lightTheme = VaultiqTheme(
  isDark: false,
  backgroundColor: _white,
  cardBackgroundColor: _cultured,
  overlayBackgroundColor: _chineseSilver,
  primaryColor: _orange,
  accentColor: _royalOrange,
  highlightColor: _lemonYellow,
  backgroundAccentColor: _lemonYellow,
  primaryAccentColor: _cultured,
  secondaryAccentColor: _philippineGray,
  primaryGreenColor: _americanGreen,
  accentGreenColor: _ufoGreen,
  primaryRedColor: _rustyRed,
  accentRedColor: _coralRed,
  transferCardBackgroundColor: _coral,
  currencySignColor: _jellyBean,
  primaryIconColor: _darkJungleGreen,
  secondaryIconColor: _philippineGray,
  transparent: _transparent,
  bodyTextColor: _darkJungleGreen,
  subTextColor: _outerSpace,
  hintTextColor: _philippineGray,
  labelTextColor: _chineseWhite,
  highlightTextColor: _outerSpace,
  lightTextColor: _white,
  black: _black,
  fontFamily: FontFamily.interFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.light,
);

const darkTheme = VaultiqTheme(
  isDark: true,
  backgroundColor: _darkJungleGreen,
  cardBackgroundColor: _darkCharcoal,
  overlayBackgroundColor: _outerSpace,
  primaryColor: _orange,
  accentColor: _royalOrange,
  highlightColor: _lemonYellow,
  backgroundAccentColor: _lemonYellow,
  primaryAccentColor: _cultured,
  secondaryAccentColor: _philippineGray,
  primaryGreenColor: _forestGreen,
  accentGreenColor: _ufoGreenDark,
  primaryRedColor: _cardinal,
  accentRedColor: _carminePink,
  transferCardBackgroundColor: _coral,
  currencySignColor: _jellyBean,
  primaryIconColor: _white,
  secondaryIconColor: _philippineGray,
  transparent: _transparent,
  bodyTextColor: _white,
  subTextColor: _chineseWhite,
  hintTextColor: _philippineGray,
  labelTextColor: _chineseWhite,
  highlightTextColor: _chineseWhite,
  lightTextColor: _white,
  black: _black,
  fontFamily: FontFamily.interFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
);

ThemeData generateThemeData(VaultiqTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: theme.fontFamily,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.primaryColor,
      selectionHandleColor: theme.primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeDisplayLarge,
      ),
      displayMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplayMedium,
      ),
      displaySmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplaySmall,
      ),
      headlineLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeDisplayMedium,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineMedium,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineSmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeTitleMedium,
      ),
      titleSmall: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeTitleMedium,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.transparent,
        statusBarIconBrightness: theme.statusBarTheme,
        systemNavigationBarColor: theme.transparent,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
