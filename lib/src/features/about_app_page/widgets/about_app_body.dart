import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/settings_section/settings_section.dart';

class AboutAppBody extends StatelessWidget {
  const AboutAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.large),
      child: Column(
        children: [
          SettingsSection(
            settingsItems: [
              SettingsItem(
                assetPath: AppAssets.peopleIcon,
                title: 'About our Team',
                onTap: () {},
              ),
              SettingsItem(
                assetPath: AppAssets.privacyPolicyIcon,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              SettingsItem(
                assetPath: AppAssets.agreementTermsIcon,
                title: 'Terms of Agreement',
                onTap: () {},
              ),
            ],
          ),
          const Spacer(),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const SizedBox.shrink();
              } else {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'v${snapshot.data!.version}',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.bodyTextColor,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
