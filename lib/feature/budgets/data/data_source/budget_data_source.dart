import 'package:d_demo/core/error/exceptions.dart';
import 'package:injectable/injectable.dart';

import '../../../../json_reader.dart';
import '../../../api/manager/api_caller.dart';
import '../../domain/entity/budget.dart';
import '../model/budget_category_model.dart';
import '../model/budget_model.dart';

abstract class BudgetDataSource {
  /// API call to get budget info.
  /// throw [ServerException] on Failure
  Future<Budget> getBudget({
    required String token,
  });

  /// API call to add new budget category.
  /// throw [ServerException] on Failure
  Future<void> addNewBudgetCategory({
    required String token,
    required BudgetCategoryModel category,
  });
}

@LazySingleton(as: BudgetDataSource)
class BudgetDataSourceImpl implements BudgetDataSource {
  final ApiCaller apiCaller;

  const BudgetDataSourceImpl({
    required this.apiCaller,
  });

  @override
  Future<void> addNewBudgetCategory({
    required String token,
    required BudgetCategoryModel category,
  }) async {
    /// api call to save new budget.
  }

  @override
  Future<Budget> getBudget({
    required String token,
  }) =>
      apiCaller.callApi(
        converter: (body, header) => BudgetModel.fromJson(body),
        request: () => readApi('budget'),
      );
}
