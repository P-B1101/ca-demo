import 'package:auto_route/auto_route.dart';
import 'package:d_demo/feature/home/presentation/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom/custom_circular_notched_rectangle.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../../../injectable_container.dart';
import '../../../budgets/presentation/bloc/budget_bloc.dart';
import '../../../router/app_router.gr.dart';
import '../../domain/entity/navigator_item.dart';
import '../cubit/navigator_controller_cubit.dart';
import '../widget/main_navigator.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  static const path = 'home';
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BudgetBloc>(
          create: (context) => getIt<BudgetBloc>(),
        ),
      ],
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  void initState() {
    super.initState();
    _handleInitState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        BudgetsRoute(),
        EventsRoute(),
        CardsRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          backgroundColor: MColors.primaryColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  MColors.plusGradientStartColor,
                  MColors.plusGradientEndColor
                ],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: _onAddClick,
                child: const Icon(
                  Fonts.plus,
                  color: MColors.whiteColor,
                  size: 20,
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UiUtils.horizontalPadding,
            ).copyWith(bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomAppBar(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: UiUtils.bottomAppBarHeight,
                notchMargin: 8,
                color: MColors.navigatorColor,
                shape: const CustomCircularNotchedRectangle(
                  notchOffset: Offset(-UiUtils.horizontalPadding, 0),
                ),
                child: MainNavigatorWidget(
                  onItemClick: (item) {
                    tabsRouter.setActiveIndex(item.tab.index);
                    _onNavigatorItemClick(item);
                  },
                ),
              ),
            ),
          ),
          body: PopScope(
            canPop: true,
            onPopInvoked: (didPop) {
              tabsRouter.setActiveIndex(0);
              context.read<NavigatorControllerCubit>().backToHome();
            },
            child: Column(
              children: [
                BlocBuilder<NavigatorControllerCubit, NavigatorControllerState>(
                  builder: (context, state) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: HeaderWidget(
                      tab: state.selectedTab,
                      onSettingClick: _onSettingClick,
                    ),
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleInitState() {
    context.read<NavigatorControllerCubit>().initList(
          main: UiUtils.mainTabs.map((e) => NavigatorItem(tab: e)).toList(),
        );
    _handleInitialTab();
  }

  void _handleInitialTab() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    final uri = Uri.base;
    final path = uri.pathSegments.lastOrNull;
    final tab = path?.pathToAppTab;
    if (tab != null) _onNavigatorItemClick(tab, false);
  }

  void _onAddClick() {
    // TODO: implement _onAddClick
  }

  void _onSettingClick() {
    // TODO: implement _onSettingClick
  }

  void _onNavigatorItemClick(NavigatorItem item, [bool updateUrl = true]) {
    final PageRouteInfo? route;
    switch (item.tab) {
      case AppTab.dashboard:
        route = const DashboardRoute();
        break;
      case AppTab.budgets:
        route = const BudgetsRoute();
        break;
      case AppTab.events:
        route = const EventsRoute();
        break;
      case AppTab.cards:
        route = const CardsRoute();
        break;
    }
    if (updateUrl) context.replaceRoute(route);
    context.read<NavigatorControllerCubit>().onTabSelected(item.tab);
  }
}
