import 'package:flutter/widgets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/features/home_page/cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  final HomeCubit homeCubit;
  const HomeBody({
    required this.homeCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
    );
  }
}
