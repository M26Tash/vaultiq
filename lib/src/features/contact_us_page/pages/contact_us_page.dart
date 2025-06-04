import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';

@RoutePage()
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: <Widget>[
        const InputField(
          hintText: 'Subject',
        ),
        const InputField(
          hintText: 'Message',
          minLines: 19,
          maxLines: 20,
        ),
        const CustomButton(buttonText: 'Submit'),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
