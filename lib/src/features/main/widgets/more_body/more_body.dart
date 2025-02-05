import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/widgets/profile_overview.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/widgets/settings_section.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        ProfileOverview(
          fullName: 'Muhammed Taş',
          email: 'tasm86688@gmail.com',
          onEditTap: () {},
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        SettingsSection(
          settingsItems: [
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.accountIcon,
              title: 'My Account',
              subtitle: 'Make changes to your account',
            ),
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.localAuthIcon,
              title: 'Face ID / Touch ID',
              subtitle: 'Manage your device security',
            ),
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.languageIcon,
              title: 'Language',
              subtitle: 'Set your preferred app language',
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        SettingsSection(
          settingsItems: [
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.questionIcon,
              title: 'Help & Support',
            ),
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.heartIcon,
              title: 'About App',
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        SettingsSection(
          settingsItems: [
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.logoutIcon,
              title: 'Log out',
              subtitle: 'Further secure your account for safety',
            ),
          ],
        ),
      ],
    );
  }
}
