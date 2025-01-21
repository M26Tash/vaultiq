import 'package:flutter/material.dart';
import 'package:sealed_currencies/sealed_currencies.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/constants/font_family.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/supported_currency/supported_currency.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';
import 'package:vaultiq/src/features/default_currency_page/cubit/default_currency_cubit.dart';
import 'package:vaultiq/src/features/default_currency_page/widgets/currency_item.dart';

// final Map<String, double> map = {
//   'USD': 1,
//   'AED': 3.6725,
//   'AFN': 71.0724,
//   'ALL': 95.1916,
//   'AMD': 396.4913,
//   'ANG': 1.79,
//   'AOA': 919.6229,
//   'ARS': 1039.75,
//   'AUD': 1.6229,
//   'AWG': 1.79,
//   'AZN': 1.7003,
//   'BAM': 1.9063,
//   'BBD': 2.0,
//   'BDT': 121.9294,
//   'BGN': 1.9054,
//   'BHD': 0.376,
//   'BIF': 2921.1293,
//   'BMD': 1.0,
//   'BND': 1.3703,
//   'BOB': 6.9218,
//   'BRL': 6.0495,
//   'BSD': 1.0,
//   'BTN': 86.1374,
//   'BWP': 14.0939,
//   'BYN': 3.447,
//   'BZD': 2.0,
//   'CAD': 1.4418,
//   'CDF': 2836.5158,
//   'CHF': 0.9156,
//   'CLP': 1005.1782,
//   'CNY': 7.3443,
//   'COP': 4336.8619,
//   'CRC': 506.2551,
//   'CUP': 24.0,
//   'CVE': 107.4707,
//   'CZK': 24.3879,
//   'DJF': 177.721,
//   'DKK': 7.2733,
//   'DOP': 61.3039,
//   'DZD': 135.6942,
//   'EGP': 50.5616,
//   'ERN': 15.0,
//   'ETB': 125.6925,
//   'EUR': 0.9747,
//   'FJD': 2.3247,
//   'FKP': 0.8172,
//   'FOK': 7.2733,
//   'GBP': 0.8172,
//   'GEL': 2.8303,
//   'GGP': 0.8172,
//   'GHS': 15.0666,
//   'GIP': 0.8172,
//   'GMD': 72.501,
//   'GNF': 8629.8022,
//   'GTQ': 7.7126,
//   'GYD': 209.0019,
//   'HKD': 7.7867,
//   'HNL': 25.4089,
//   'HRK': 7.3436,
//   'HTG': 130.5277,
//   'HUF': 402.2837,
//   'IDR': 16230.0084,
//   'ILS': 3.6828,
//   'IMP': 0.8172,
//   'INR': 86.1379,
//   'IQD': 1310.641,
//   'IRR': 42012.7429,
//   'ISK': 141.1135,
//   'JEP': 0.8172,
//   'JMD': 156.4468,
//   'JOD': 0.709,
//   'JPY': 157.9027,
//   'KES': 129.2652,
//   'KGS': 86.986,
//   'KHR': 4048.8048,
//   'KID': 1.6228,
//   'KMF': 479.5003,
//   'KRW': 1470.5992,
//   'KWD': 0.3085,
//   'KYD': 0.8333,
//   'KZT': 526.4816,
//   'LAK': 21891.2383,
//   'LBP': 89500.0,
//   'LKR': 294.538,
//   'LRD': 186.8627,
//   'LSL': 19.0676,
//   'LYD': 4.9221,
//   'MAD': 10.0511,
//   'MDL': 18.613,
//   'MGA': 4714.0338,
//   'MKD': 59.6439,
//   'MMK': 2097.7264,
//   'MNT': 3426.9752,
//   'MOP': 8.0203,
//   'MRU': 39.8465,
//   'MUR': 46.7005,
//   'MVR': 15.4476,
//   'MWK': 1744.3155,
//   'MXN': 20.6544,
//   'MYR': 4.4962,
//   'MZN': 63.9678,
//   'NAD': 19.0676,
//   'NGN': 1543.6265,
//   'NIO': 36.7791,
//   'NOK': 11.449,
//   'NPR': 137.8198,
//   'NZD': 1.7977,
//   'OMR': 0.3845,
//   'PAB': 1.0,
//   'PEN': 3.7733,
//   'PGK': 4.0059,
//   'PHP': 58.5846,
//   'PKR': 278.609,
//   'PLN': 4.148,
//   'PYG': 7879.7792,
//   'QAR': 3.64,
//   'RON': 4.8286,
//   'RSD': 113.5815,
//   'RUB': 102.1659,
//   'RWF': 1396.7899,
//   'SAR': 3.75,
//   'SBD': 8.4788,
//   'SCR': 14.2809,
//   'SDG': 510.3949,
//   'SEK': 11.204,
//   'SGD': 1.3703,
//   'SHP': 0.8172,
//   'SLE': 22.6258,
//   'SLL': 22625.7763,
//   'SOS': 570.9624,
//   'SRD': 35.1108,
//   'SSP': 4040.6179,
//   'STN': 23.8791,
//   'SYP': 12922.9892,
//   'SZL': 19.0676,
//   'THB': 34.6409,
//   'TJS': 10.9249,
//   'TMT': 3.4997,
//   'TND': 3.2209,
//   'TOP': 2.4027,
//   'TRY': 35.4374,
//   'TTD': 6.7692,
//   'TVD': 1.6228,
//   'TWD': 33.0067,
//   'TZS': 2467.0008,
//   'UAH': 42.2955,
//   'UGX': 3703.7632,
//   'UYU': 43.7893,
//   'UZS': 12950.4607,
//   'VES': 53.8791,
//   'VND': 25366.732,
//   'VUV': 119.1035,
//   'WST': 2.8432,
//   'XAF': 639.3337,
//   'XCD': 2.7,
//   'XDR': 0.7701,
//   'XOF': 639.3337,
//   'XPF': 116.3079,
//   'YER': 249.1032,
//   'ZAR': 19.0614,
//   'ZMW': 27.908,
//   'ZWL': 26.0579,
// };

class DefaultCurrencyBody extends StatefulWidget {
  final DefaultCurrencyCubit defaultCurrencyCubit;
  final String? defaultCurrency;
  const DefaultCurrencyBody({
    required this.defaultCurrencyCubit,
    required this.defaultCurrency,
    super.key,
  });

  @override
  State<DefaultCurrencyBody> createState() => _DefaultCurrencyBodyState();
}

class _DefaultCurrencyBodyState extends State<DefaultCurrencyBody> {
  late final TextEditingController searchController;
  late final List<String> currencyList;
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    currencyList = SupportedCurrency.currencies.toList();
    filteredList = currencyList;

    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredList = currencyList.where((entry) {
        final currencyCode = entry.toLowerCase();
        final currencyName =
            FiatCurrency.maybeFromCode(entry)?.name.toLowerCase() ?? '';
        return currencyCode.contains(query) || currencyName.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Text(
          context.locale.chooseTheCurrency,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayPreLarge,
            color: context.theme.bodyTextColor,
            fontWeight: AppFonts.weightBold,
            fontFamily: FontFamily.poppinsFamily,
          ),
        ),
        const SizedBox(height: AppDimensions.preLarge),
        Text(
          context.locale.selectYourDefaultCurrency,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.labelTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          controller: searchController,
          prefixIcon: VectorImage(
            svgAssetPath: AppAssets.searchIcon,
            color: context.theme.primaryIconColor,
          ),
          hintText: context.locale.search,
        ),
        const SizedBox(height: AppDimensions.large),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filteredList.length,
          itemBuilder: (context, index) => CurrencyItem(
            entry: filteredList[index],
            defaultCurrency: widget.defaultCurrency,
            onCurrencyChanged: (currency) =>
                widget.defaultCurrencyCubit.chooseDefaultCurrency(currency),
          ),
        ),
      ],
    );
  }
}
