import '../../../../core/utils/extensions.dart';
import '../../domain/entity/budget_category.dart';

class BudgetCategoryModel extends BudgetCategory {
  const BudgetCategoryModel({
    required super.amount,
    required super.color,
    required super.icon,
    required super.name,
    required super.total,
  });

  factory BudgetCategoryModel.fromEntity(BudgetCategory entity) =>
      BudgetCategoryModel(
        amount: entity.amount,
        color: entity.color,
        icon: entity.icon,
        name: entity.name,
        total: entity.total,
      );

  factory BudgetCategoryModel.fromJson(Map<String, dynamic> json) =>
      BudgetCategoryModel(
        amount: json['amount'],
        color: json.toEnum('color', (value) => value.toCategoryColor),
        icon: json.toEnum('icon', (value) => value.toCategoryIcon),
        name: json['name'],
        total: json['total'],
      );

  Map<String, dynamic> get toJson => {
        'amount': amount,
        'color': color?.toValue,
        'icon': icon?.toValue,
        'name': name,
        'total': total,
      };
}
