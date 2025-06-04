// ignore_for_file: lines_longer_than_80_chars
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/features/help_center_page/cubit/help_center_cubit.dart';

@RoutePage()
class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  final cubit = i.get<HelpCenterCubit>();

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = context.locale;
    cubit.fetchFaq(Locale(locale.localeName));
  }

  void _listener(BuildContext context, HelpCenterState state) {
    if (state.route.type == TypeRoute.pop) {
      context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(HelpCenterState prev, HelpCenterState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HelpCenterCubit>(
      child: BlocConsumer<HelpCenterCubit, HelpCenterState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<HelpCenterCubit>(context);
          return AutoTabsRouter(
            lazyLoad: false,
            routes: const [
              FAQRoute(),
              ContactUsRoute(),
            ],
            transitionBuilder: (context, child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            builder: (context, child) {
              final tabsRouter = AutoTabsRouter.of(context);
              return Scaffold(
                backgroundColor: context.theme.backgroundColor,
                appBar: CustomAppBar(
                  svgAssetPath: AppAssets.arrowLeftIcon,
                  onLeadingTap: cubit.navigateBack,
                  title: 'Help & Support',
                  bottom: TabBar(
                    controller: tabController,
                    onTap: tabsRouter.setActiveIndex,
                    indicatorColor: context.theme.primaryColor,
                    labelColor: context.theme.primaryColor,
                    unselectedLabelColor: context.theme.hintTextColor,
                    dividerColor: context.theme.transparent,
                    tabs: const [
                      Tab(
                        text: 'FAQ',
                      ),
                      Tab(
                        text: 'Contact Us',
                      ),
                    ],
                  ),
                ),
                body: child,
              );
            },
          );
        },
      ),
    );
  }
}
