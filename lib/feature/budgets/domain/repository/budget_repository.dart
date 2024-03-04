import 'package:d_demo/feature/budgets/domain/entity/budget.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/budget_category.dart';

abstract class BudgetRepository {
  Future<Either<Failure, Budget>> getBudget();

  Future<Either<Failure, void>> addNewCategory(BudgetCategory category);
}
