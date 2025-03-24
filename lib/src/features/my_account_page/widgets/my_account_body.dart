import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class MyAccountBody extends StatelessWidget {
  const MyAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(AppAssets.person),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.small(
                      backgroundColor: context.theme.primaryColor,
                      shape: const CircleBorder(),
                      elevation: AppDimensions.none,
                      child: VectorImage(
                        svgAssetPath: AppAssets.imageAddIcon,
                        color: context.theme.primaryIconColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        InputField(
          fieldTitle: context.locale.username,
          hintText: 'm26_tash',
        ),
        InputField(
          fieldTitle: context.locale.fullName,
          hintText: 'Muhammed Taş',
        ),
        InputField(
          fieldTitle: context.locale.email,
          hintText: 'test@gmail.com',
        ),
        InputField(
          fieldTitle: context.locale.dateOfBirth,
          hintText: '6th June 1996',
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
