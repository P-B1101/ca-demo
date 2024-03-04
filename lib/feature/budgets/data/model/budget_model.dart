import '../../../../core/utils/extensions.dart';
import '../../domain/entity/budget.dart';
import 'budget_category_model.dart';

class BudgetModel extends Budget {
  const BudgetModel({
    required super.budget,
    required super.categories,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) => BudgetModel(
        categories: json.toListModel(
          'categories',
          (value) => BudgetCategoryModel.fromJson(value),
        ),
        budget: json['budget'],
      );
}
