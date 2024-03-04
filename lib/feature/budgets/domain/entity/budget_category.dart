import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class BudgetCategory extends Equatable {
  final String? name;
  final num? total;
  final num? amount;
  final CategoryColor? color;
  final CategoryIcon? icon;

  const BudgetCategory({
    required this.name,
    required this.total,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        name,
        total,
        amount,
        color,
        icon,
      ];

  factory BudgetCategory.empty() => const BudgetCategory(
        name: null,
        total: null,
        amount: null,
        color: null,
        icon: null,
      );

  factory BudgetCategory.add({
    required String? name,
    required num? total,
    required CategoryColor? color,
    required CategoryIcon? icon,
  }) =>
      BudgetCategory(
        name: name,
        total: total,
        amount: total,
        color: color,
        icon: icon,
      );

  num get getTotal => total ?? 0;

  num get getAmount => amount ?? 0;

  double get getPercent {
    if (getTotal == 0) return 0;
    return getAmount / getTotal;
  }

  num get getLeftAmount => getTotal - getAmount;
}
