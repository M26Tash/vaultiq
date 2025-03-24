import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/localization/flutter_gen/vaultiq_localizations.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/support_methods/support_methods.dart';
import 'package:vaultiq/src/features/main/cubits/more_cubit/more_cubit.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/widgets/language_item.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/widgets/profile_overview.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/widgets/settings_section.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  Future<void> languageBottomSheet({
    required BuildContext context,
    required String currentLocale,
    required ValueChanged<String> onValueChanged,
  }) async {
    await SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: context.locale.language,
      useRootNavigator: true,
      child: Column(
        children: <Widget>[
          for (final language in VaultiqLocalization.supportedLocales)
            LanguageItem(
              languageCode: language.languageCode,
              currentLocale: currentLocale,
              onValueChanged: onValueChanged,
            ),
        ].insertBetween(
          const SizedBox(
            height: AppDimensions.large,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MoreCubit>(
      child: BlocBuilder<MoreCubit, MoreState>(
        builder: (context, state) {
          final cubit = CubitScope.of<MoreCubit>(context);
          return ListView(
            padding: const EdgeInsets.all(AppDimensions.large),
            children: [
              ProfileOverview(
                fullName: 'Muhammed Taş',
                email: 'tasm86688@gmail.com',
                onEditTap: cubit.navigateToMyAccountPage,
              ),
              const SizedBox(height: AppDimensions.extraLarge),
              SettingsSection(
                settingsItems: [
                  SettingsItem(
                    onTap: cubit.navigateToMyAccountPage,
                    assetPath: AppAssets.accountIcon,
                    title: context.locale.myAccount,
                    subtitle: context.locale.makeChangesToYourAccount,
                  ),
                  SettingsItem(
                    onTap: () {},
                    assetPath: AppAssets.localAuthIcon,
                    title: context.locale.faceIdTouchId,
                    subtitle: context.locale.manageYourDeviceSecurity,
                    suffix: CupertinoSwitch(
                      activeTrackColor: context.theme.primaryColor,
                      value: state.isLocalAuthEnabled,
                      onChanged: (value) => cubit.toggleLocalAuthSwitcher(
                        value: value,
                      ),
                    ),
                  ),
                  SettingsItem(
                    onTap: () => languageBottomSheet(
                      context: context,
                      currentLocale: context.locale.localeName,
                      onValueChanged: cubit.updateLocale,
                    ),
                    assetPath: AppAssets.languageIcon,
                    title: context.locale.language,
                    subtitle: context.locale.setYourPreferredAppLanguage,
                  ),
                  SettingsItem(
                    onTap: () {},
                    assetPath: AppAssets.brushIcon,
                    title: 'Appearance',
                    subtitle: 'Light or Dark, your choice',
                    suffix: CupertinoSwitch(
                      thumbIcon: WidgetStatePropertyAll(
                        state.isDarkThemeEnabled == true
                            ? const Icon(
                                Icons.dark_mode_rounded,
                              )
                            : const Icon(
                                Icons.light_mode_rounded,
                              ),
                      ),
                      activeTrackColor: context.theme.primaryColor,
                      value: state.isDarkThemeEnabled,
                      onChanged: (value) => cubit.toggleThemeSwitcher(
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.large),
              SettingsSection(
                settingsItems: [
                  SettingsItem(
                    onTap: () {},
                    assetPath: AppAssets.questionIcon,
                    title: context.locale.helpAndSupport,
                  ),
                  SettingsItem(
                    onTap: () {},
                    assetPath: AppAssets.heartIcon,
                    title: context.locale.aboutApp,
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.large),
              SettingsSection(
                settingsItems: [
                  SettingsItem(
                    onTap: () {},
                    assetPath: AppAssets.logoutIcon,
                    title: context.locale.logOut,
                    subtitle: context.locale.furtherSecureYourAccountForSafety,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
