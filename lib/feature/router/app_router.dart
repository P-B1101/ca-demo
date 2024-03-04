import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../budgets/presentation/page/budgets_page.dart';
import '../cards/presentation/page/cards_page.dart';
import '../dashboard/presentation/page/dashboard_page.dart';
import '../events/presentation/page/events_page.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Widget,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: DashboardPage.path),
            AutoRoute(
              path: DashboardPage.path,
              page: DashboardRoute.page,
              maintainState: false,
              keepHistory: false,
            ),
            AutoRoute(
              path: BudgetsPage.path,
              page: BudgetsRoute.page,
              maintainState: false,
              keepHistory: false,
            ),
            AutoRoute(
              path: EventsPage.path,
              page: EventsRoute.page,
              maintainState: false,
              keepHistory: false,
            ),
            AutoRoute(
              path: CardsPage.path,
              page: CardsRoute.page,
              maintainState: false,
              keepHistory: false,
            ),
          ],
        ),
      ];

  @override
  RouteType get defaultRouteType => RouteType.custom(
        durationInMilliseconds: 200,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = 0.0;
          var end = 1.0;
          var tween = Tween<double>(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            reverseCurve: Curves.easeIn,
            curve: Curves.easeOut,
          );

          return FadeTransition(
            opacity: tween.animate(curvedAnimation),
            child: child,
          );
        },
      );

  static PageRoute getRoute({
    required Widget page,
    required RouteSettings settings,
  }) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        settings: settings,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = 0.0;
          var end = 1.0;

          var tween = Tween<double>(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            reverseCurve: Curves.easeIn,
            curve: Curves.easeOut,
          );
          return FadeTransition(
            opacity: tween.animate(curvedAnimation),
            child: child,
          );
        },
      );
}
