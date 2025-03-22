// ignore_for_file: deprecated_member_use

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sealed_currencies/sealed_currencies.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_selection_type.dart';
import 'package:vaultiq/src/common/utils/extensions/context_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/currency_input_formatter.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/string_extension.dart';
import 'package:vaultiq/src/common/utils/supported_currency/supported_currency.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';
import 'package:vaultiq/src/common/widgets/support_methods/support_methods.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/features/add_transaction_page/cubit/add_transaction_cubit.dart';
import 'package:vaultiq/src/features/add_transaction_page/widgets/wallet_selection.dart';

class AddTransactionBody extends StatefulWidget {
  final List<WalletModel?> wallets;
  final TransactionType transactionType;
  final WalletModel? selectedNormalWallet;
  final WalletModel? selectedToWallet;
  final AddTransactionCubit cubit;
  final String currency;
  final DateTime? selectedDateTime;
  const AddTransactionBody({
    required this.wallets,
    required this.transactionType,
    required this.currency,
    required this.selectedNormalWallet,
    required this.selectedToWallet,
    required this.cubit,
    required this.selectedDateTime,
    super.key,
  });

  @override
  State<AddTransactionBody> createState() => _AddTransactionBodyState();
}

class _AddTransactionBodyState extends State<AddTransactionBody> {
  late final TextEditingController _amountController;
  late final TextEditingController _titleController;

  late final GlobalKey<FormState> _titleKey;
  late final GlobalKey<FormState> _amountKey;
  late final GlobalKey<FormState> _dateKey;

  final supportedCurrencyList = <SelectedListItem<String>>[];

  @override
  void initState() {
    super.initState();

    _amountController = TextEditingController();
    _titleController = TextEditingController();

    _titleKey = GlobalKey<FormState>();
    _amountKey = GlobalKey<FormState>();
    _dateKey = GlobalKey<FormState>();

    _fetchSupportedCurrencies();
  }

  void _fetchSupportedCurrencies() {
    for (final currency in SupportedCurrency.currencies.toList()) {
      final currencyName = (FiatCurrency.maybeFromCode(currency)
                  ?.namesNative
                  .first
                  .toLowerCase() ??
              '')
          .capitalize();
      if (currencyName != '') {
        supportedCurrencyList.add(
          SelectedListItem(
            data: '$currency - $currencyName',
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    _amountController.dispose();
    _titleController.dispose();
  }

  Future<void> showCurrencies() async {
    DropDownState<String>(
      dropDown: DropDown<String>(
        dropDownBackgroundColor: context.theme.cardBackgroundColor,
        searchFillColor: context.theme.backgroundColor,
        listItemBuilder: (index, dataItem) {
          return Row(
            children: [
              Text(
                dataItem.data,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
            ],
          );
        },
        searchCursorColor: context.theme.primaryColor,
        listViewSeparatorWidget: Divider(
          color: context.theme.secondaryAccentColor,
        ),
        searchHintText: r'$ - United States Dollar',
        data: supportedCurrencyList,
        onSelected: (selectedItems) {
          final list = <String>[];
          for (final item in selectedItems) {
            list.add(item.data);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                list.toString(),
              ),
            ),
          );
        },
      ),
    ).showModal(context);
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();

    final date = await SupportMethods.showVaultiqDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.copyWith(month: now.month + 6),
        locale: Locale(context.locale.localeName),
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
              datePickerTheme: DatePickerThemeData(
                dividerColor: context.theme.primaryColor,
                shape: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.preLarge),
                  ),
                ),
                headerForegroundColor: context.theme.bodyTextColor,
                headerBackgroundColor: context.theme.primaryColor,
                dayOverlayColor: MaterialStateProperty.all(
                  context.theme.primaryColor.withOpacity(0.1),
                ),
                yearOverlayColor: MaterialStateProperty.all(
                  context.theme.primaryColor.withOpacity(0.1),
                ),
                confirmButtonStyle: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.primaryColor,
                  foregroundColor: context.theme.bodyTextColor,
                  textStyle: context.themeData.textTheme.bodyLarge?.copyWith(
                    color: context.theme.bodyTextColor,
                  ),
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: context.theme.primaryColor,
              ),
            ),
            child: child!,
          );
        },
      ),
    );

    if (date != null) {
      widget.cubit.selectDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.wallets.first == null) {
      return Column(
        children: [
          Text(
            // ignore: lines_longer_than_80_chars
            'Please create a new wallet before adding ${widget.transactionType}',
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.bodyTextColor,
            ),
          ),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: <Widget>[
        InputField(
          formKey: _titleKey,
          controller: _titleController,
          hintText: 'Title',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Title can not be empty';
            }
            return null;
          },
        ),
        InputField(
          formKey: _amountKey,
          controller: _amountController,
          hintText: r'$ 100,302.32',
          formatters: [
            CurrencyInputFormatter(),
          ],
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Amount cannot be empty';
            }

            final rawValue = value.getRawValue();

            if (rawValue.isEmpty) {
              return 'Amount cannot be empty';
            }

            final doubleAmount = double.tryParse(rawValue) ?? -1;

            if (doubleAmount <= 0) {
              return 'Amount must be greater than zero';
            }

            return null;
          },
        ),
        InputField(
          hintText: r'$ - United States Dollar',
          onTap: showCurrencies,
        ),
        InputField(
          formKey: _dateKey,
          hintText: widget.selectedDateTime != null
              ? DateFormat('dd - MM yyyy, hh:mm')
                  .format(widget.selectedDateTime!)
              : 'Select Date',
          hintStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.subTextColor,
            fontWeight: AppFonts.weightMedium,
          ),
          suffixIcon: TextButton(
            onPressed: () => widget.cubit.selectDate(
              DateTime.now(),
            ),
            child: Text(
              'now',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: AppFonts.weightMedium,
              ),
            ),
          ),
          onTap: () => _showDatePicker(context),
          validator: (p0) {
            if (widget.selectedDateTime == null) {
              return 'Please select date time';
            }
            return null;
          },
        ),
        if (widget.transactionType != TransactionType.transfer)
          InputField(
            hintText: 'Category',
            onTap: () {},
          ),
        Text(
          'Select Wallet',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.bodyTextColor,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: widget.wallets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimensions.large,
            mainAxisSpacing: AppDimensions.large,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return WalletSelection(
              cubit: widget.cubit,
              wallets: widget.wallets,
              wallet: widget.wallets[index]!,
              selectedWallet: widget.selectedNormalWallet,
              walletSelectionType: WalletSelectionType.normal,
            );
          },
        ),
        if (widget.transactionType == TransactionType.transfer)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From Wallet',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.bodyTextColor,
                ),
              ),
              const SizedBox(height: AppDimensions.medium),
              GridView.builder(
                shrinkWrap: true,
                itemCount: widget.wallets.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDimensions.large,
                  mainAxisSpacing: AppDimensions.large,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return WalletSelection(
                    cubit: widget.cubit,
                    wallets: widget.wallets,
                    wallet: widget.wallets[index]!,
                    selectedWallet: widget.selectedToWallet,
                    walletSelectionType: WalletSelectionType.to,
                  );
                },
              ),
            ],
          ),
        CustomButton(
          buttonText: 'Add',
          onTap: () {
            final titleValidate = _titleKey.currentState!.validate();
            final amountValidate = _amountKey.currentState!.validate();
            final dateValidate = _dateKey.currentState!.validate();

            final rawAmount = _amountController.text.getRawValue();
            final doubleAmount = double.tryParse(rawAmount);
            final selectedDateTimeUtc = widget.selectedDateTime?.toUtc();

            if (titleValidate &&
                amountValidate &&
                dateValidate &&
                selectedDateTimeUtc != null &&
                widget.selectedNormalWallet != null) {
              widget.cubit.addTransaction(
                TransactionModel(
                  walletId: widget.selectedNormalWallet!.id,
                  createdAt: '$selectedDateTimeUtc',
                  transactionType: widget.transactionType,
                  transactionTitle: _titleController.text.trim(),
                  defaultCurrency: 'TRY',
                  defaultAmount: doubleAmount!,
                  amountInUsd: 2,
                  toWalletId: widget.selectedToWallet?.id,
                ),
              );
            }

            if (widget.selectedNormalWallet == null) {
              context.showErrorSnackBar(
                // ignore: lines_longer_than_80_chars
                'Please select wallet from which you would like to record transaction',
              );
            }
          },
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
