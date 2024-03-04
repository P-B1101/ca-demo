import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../feature/budgets/domain/entity/budget_category.dart';
import '../../feature/budgets/presentation/page/budgets_page.dart';
import '../../feature/cards/presentation/page/cards_page.dart';
import '../../feature/dashboard/presentation/page/dashboard_page.dart';
import '../../feature/events/presentation/page/events_page.dart';
import '../../feature/home/domain/entity/navigator_item.dart';
import '../../feature/language/manager/localizatios.dart';
import '../components/custom/half_circle_progress.dart';
import 'assets.dart';
import 'enums.dart';

extension DoubleExt on double {
  bool get isSmall => this <= 360;

  bool get isExtraSmall => this <= 311;

  double get scaleFactor => isExtraSmall
      ? .9
      : isSmall
          ? 1.0
          : 1.1;
}

extension NumExt on num {
  bool get isInt => (this % 1) == 0;
  String get toCurrency {
    final NumberFormat formatter = NumberFormat.decimalPattern('en');
    return formatter.format(this);
  }
}

extension StringExt on String {
  CategoryColor? get toCategoryColor => switch (this) {
        'COLOR_1' => CategoryColor.color1,
        'COLOR_2' => CategoryColor.color2,
        'COLOR_3' => CategoryColor.color3,
        _ => null,
      };

  CategoryIcon? get toCategoryIcon => switch (this) {
        'CAR' => CategoryIcon.car,
        'ENTERTAINMENT' => CategoryIcon.entertainment,
        'FINGERPRINT' => CategoryIcon.fingerprint,
        _ => null,
      };

  NavigatorItem? get pathToAppTab {
    switch (this) {
      case DashboardPage.path:
        return const NavigatorItem(tab: AppTab.dashboard);
      case BudgetsPage.path:
        return const NavigatorItem(tab: AppTab.budgets);
      case EventsPage.path:
        return const NavigatorItem(tab: AppTab.events);
      case CardsPage.path:
        return const NavigatorItem(tab: AppTab.cards);
    }
    return null;
  }
}

extension AppTabExt on AppTab {
  IconData get toIconData => switch (this) {
        AppTab.dashboard => Fonts.dashboard,
        AppTab.budgets => Fonts.budgets,
        AppTab.events => Fonts.events,
        AppTab.cards => Fonts.cards,
      };

  EdgeInsetsGeometry get getMargin => switch (this) {
        AppTab.dashboard => EdgeInsets.zero,
        AppTab.budgets => const EdgeInsetsDirectional.only(end: 50),
        AppTab.events => const EdgeInsetsDirectional.only(start: 50),
        AppTab.cards => EdgeInsets.zero,
      };

  String toStringValue(BuildContext context) => switch (this) {
        AppTab.dashboard => Strings.of(context).app_tab_dashboard,
        AppTab.budgets => Strings.of(context).app_tab_budgets,
        AppTab.events => Strings.of(context).app_tab_events,
        AppTab.cards => Strings.of(context).app_tab_cards,
      };
}

extension CategoryColorExt on CategoryColor {
  Color get toColor => switch (this) {
        CategoryColor.color1 => MColors.categoryColor1,
        CategoryColor.color2 => MColors.categoryColor2,
        CategoryColor.color3 => MColors.categoryColor3,
      };

  String get toValue => switch (this) {
        CategoryColor.color1 => 'COLOR_1',
        CategoryColor.color2 => 'COLOR_2',
        CategoryColor.color3 => 'COLOR_3',
      };
}

extension CategoryIconExt on CategoryIcon {
  IconData get toIcon => switch (this) {
        CategoryIcon.car => Fonts.car,
        CategoryIcon.entertainment => Fonts.entertainment,
        CategoryIcon.fingerprint => Fonts.fingerprint,
      };

  String get toValue => switch (this) {
        CategoryIcon.car => 'CAR',
        CategoryIcon.entertainment => 'ENTERTAINMENT',
        CategoryIcon.fingerprint => 'FINGERPRINT',
      };
}

extension MapStringDynamicExt on Map<String, dynamic> {
  T? toEnum<T extends Enum>(String key, T? Function(String value) converter) {
    final value = this[key];
    if (value is! String) return null;
    return converter(value);
  }

  T? toModel<T extends Equatable>(
    String key,
    T? Function(dynamic value) converter,
  ) {
    final value = this[key];
    if (value == null) return null;
    return converter(value);
  }

  List<T> toListModel<T extends Equatable>(
    String key,
    T Function(dynamic value) converter,
  ) {
    final value = this[key];
    if (value is! List) return <T>[];
    return value.map((e) => converter(e)).toList();
  }
}

extension BudgetCategoryListExt on List<BudgetCategory> {
  List<ProgressItem> toProgressItem(num? totalBudget) =>
      map((e) => ProgressItem(
            color: e.color?.toColor,
            percent: totalBudget == null || totalBudget == 0
                ? 0
                : e.getTotal / totalBudget,
          )).toList();
}

extension BudgetStatusExt on BudgetStatus {
  String toStringValue(BuildContext context) => switch (this) {
        BudgetStatus.good => Strings.of(context).budget_status_good,
        BudgetStatus.bad => Strings.of(context).budget_status_bad,
      };
}
