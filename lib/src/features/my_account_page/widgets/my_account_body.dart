// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/features/my_account_page/cubit/my_account_cubit.dart';

class MyAccountBody extends StatefulWidget {
  final MyAccountCubit myAccountCubit;
  final XFile? image;
  final ProfileModel profileModel;
  const MyAccountBody({
    required this.myAccountCubit,
    required this.image,
    required this.profileModel,
    super.key,
  });

  @override
  State<MyAccountBody> createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  late final TextEditingController _userNameController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _userNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
  }

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
                CircleAvatar(
                  backgroundColor: context.theme.cardBackgroundColor,
                  radius: 70,
                  backgroundImage: widget.profileModel.avatarUrl != null
                      ? NetworkImage(widget.profileModel.avatarUrl!)
                      : const AssetImage(AppAssets.person),
                
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.small(
                      backgroundColor: context.theme.primaryColor,
                      shape: const CircleBorder(),
                      elevation: AppDimensions.none,
                      // ! Note: upload method is implemented in _onNewImage in cubit
                      onPressed: widget.myAccountCubit.getImage,
                      child: VectorImage(
                        svgAssetPath: AppAssets.imageAddIcon,
                        color: context.theme.primaryIconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        InputField(
          controller: _userNameController,
          fieldTitle: context.locale.username,
          hintText: widget.profileModel.userName,
        ),
        InputField(
          controller: _fullNameController,
          fieldTitle: context.locale.fullName,
          hintText: widget.profileModel.fullName,
        ),
        InputField(
          controller: _emailController,
          fieldTitle: context.locale.email,
          hintText: widget.profileModel.email,
        ),
        InputField(
          fieldTitle: context.locale.dateOfBirth,
          hintText: widget.profileModel.dateOfBirth != null
              ? widget.profileModel.dateOfBirth.toString()
              : '''You didn't set your birthday''',
        ),
        CustomButton(
          onTap: () => widget.myAccountCubit.updateProfile(
            ProfileModel(
              userName: _userNameController.text,
              fullName: _fullNameController.text,
              email: _emailController.text,
            ),
          ),
          buttonText: 'Update',
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
