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

const lightTheme = VaultiqTheme(
  isDark: false,
  primaryBackgroundColor: _white,
  secondaryBackgroundColor: _cultured,
  tertiaryBackgroundColor: _chineseSilver,
  mainAppColor: _orange,
  secondaryColor: _royalOrange,
  tertiaryColor: _lemonYellow,
  quaternaryColor: _lemonYellow,
  primaryAccent: _cultured,
  secondaryAccent: _philippineGray,
  defaultIconColor: _chineseSilver,
  secondaryIconColor: _darkJungleGreen,
  transparent: _transparent,
  primaryTextColor: _darkJungleGreen,
  secondaryTextColor: _outerSpace,
  tertiaryTextColor: _outerSpace,
  quaternaryTextColor: _outerSpace,
  fivefoldTextColor: _outerSpace,
  whiteTextColor: _white,
  blackColor: _black,
  fontFamily: FontFamily.interFamily,
  statusBarBrightness: Brightness.dark,
  navigationBarBrightness: Brightness.light,
);

const darkTheme = VaultiqTheme(
  isDark: true,
  primaryBackgroundColor: _darkJungleGreen,
  secondaryBackgroundColor: _darkCharcoal,
  tertiaryBackgroundColor: _outerSpace,
  mainAppColor: _orange,
  secondaryColor: _royalOrange,
  tertiaryColor: _lemonYellow,
  quaternaryColor: _lemonYellow,
  primaryAccent: _cultured,
  secondaryAccent: _philippineGray,
  defaultIconColor: _outerSpace,
  secondaryIconColor: _white,
  transparent: _transparent,
  primaryTextColor: _white,
  secondaryTextColor: _chineseWhite,
  tertiaryTextColor: _chineseWhite,
  quaternaryTextColor: _chineseWhite,
  fivefoldTextColor: _chineseWhite,
  whiteTextColor: _white,
  blackColor: _black,
  fontFamily: FontFamily.interFamily,
  statusBarBrightness: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
);

ThemeData generateThemeData(VaultiqTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: theme.fontFamily,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.mainAppColor,
      selectionHandleColor: theme.mainAppColor,
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
        statusBarIconBrightness: theme.statusBarBrightness,
        systemNavigationBarColor: theme.transparent,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
