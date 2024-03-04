import 'package:d_demo/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import 'budget_category.dart';

class Budget extends Equatable {
  final List<BudgetCategory> categories;
  final num? budget;

  const Budget({
    required this.budget,
    required this.categories,
  });

  @override
  List<Object?> get props => [categories, budget];

  factory Budget.empty() => const Budget(
        budget: 0,
        categories: [],
      );

  num get getAvailableBudget => categories
      .map((e) => e.getAmount)
      .reduce((value, element) => value + element);

  BudgetStatus get getBudgetStatus =>
      getAvailableBudget > 0 ? BudgetStatus.good : BudgetStatus.bad;
}
