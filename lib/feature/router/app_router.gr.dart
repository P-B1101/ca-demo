// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:d_demo/feature/budgets/presentation/page/budgets_page.dart'
    as _i1;
import 'package:d_demo/feature/cards/presentation/page/cards_page.dart' as _i2;
import 'package:d_demo/feature/dashboard/presentation/page/dashboard_page.dart'
    as _i3;
import 'package:d_demo/feature/events/presentation/page/events_page.dart'
    as _i4;
import 'package:d_demo/feature/home/presentation/page/home_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BudgetsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BudgetsPage(),
      );
    },
    CardsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CardsPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EventsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BudgetsPage]
class BudgetsRoute extends _i6.PageRouteInfo<void> {
  const BudgetsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BudgetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BudgetsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CardsPage]
class CardsRoute extends _i6.PageRouteInfo<void> {
  const CardsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventsPage]
class EventsRoute extends _i6.PageRouteInfo<void> {
  const EventsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
