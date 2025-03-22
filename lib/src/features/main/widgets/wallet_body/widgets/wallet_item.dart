import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/convertors/payment_method_convertor.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/string_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';

class WalletItemSection extends StatelessWidget {
  final WalletModel walletModel;
  const WalletItemSection({
    required this.walletModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                walletModel.walletName,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  fontSize: AppFonts.sizeHeadlinePreLarge,
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              const Spacer(),
              VectorImage(
                svgAssetPath: AppAssets.eyeIcon,
                color: context.theme.primaryIconColor,
              ),
              const SizedBox(width: AppDimensions.large),
              VectorImage(
                svgAssetPath: AppAssets.dotIcon,
                color: context.theme.primaryIconColor,
              ),
            ],
          ),
          WalletItem(walletModel: walletModel),
        ].insertBetween(
          const SizedBox(
            height: AppDimensions.large,
          ),
        ),
      ),
    );
  }
}

class WalletItem extends StatelessWidget {
  final WalletModel walletModel;
  const WalletItem({
    required this.walletModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        children: [
          _WalletItemHeader(
            walletModel: walletModel,
          ),
          const SizedBox(height: AppDimensions.large),
          _WalletItemBody(walletModel: walletModel),
          const SizedBox(height: AppDimensions.extraLarge),
          _WalletItemFooter(walletModel: walletModel),
        ],
      ),
    );
  }
}

class _WalletItemHeader extends StatelessWidget {
  final WalletModel walletModel;
  const _WalletItemHeader({
    required this.walletModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Balance',
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            // ignore: deprecated_member_use
            color: context.theme.bodyTextColor.withOpacity(.6),
            fontWeight: AppFonts.weightMedium,
          ),
        ),
        if (walletModel.cardPaymentMethod != null)
          Image.asset(
            PaymentMethodConvertor.convertToAsset(
              walletModel.cardPaymentMethod!,
            ),
          ),
      ],
    );
  }
}

class _WalletItemBody extends StatelessWidget {
  final WalletModel walletModel;
  const _WalletItemBody({
    required this.walletModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            // ignore: lines_longer_than_80_chars
            '${NumberFormat.simpleCurrency(name: walletModel.currencyCode).currencySymbol} ${walletModel.balance}',
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.sizeDisplayPreLarge,
              color: context.theme.bodyTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.preLarge),
        Align(
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightSemiBold,
              ),
              children: [
                TextSpan(
                  text:
                      // ignore: lines_longer_than_80_chars
                      '${NumberFormat.simpleCurrency(name: walletModel.currencyCode).currencySymbol} ${walletModel.limit}',
                ),
                const WidgetSpan(
                  child: SizedBox(width: AppDimensions.large),
                ),
                TextSpan(
                  text: 'Limit',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color:
                        // ignore: deprecated_member_use
                        context.theme.bodyTextColor.withOpacity(.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WalletItemFooter extends StatelessWidget {
  final WalletModel walletModel;
  const _WalletItemFooter({
    required this.walletModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          walletModel.holderName,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.bodyTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        if (walletModel.validThru != null)
          Text(
            walletModel.validThru!.toValidThruFormat(),
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.bodyTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
      ],
    );
  }
}
