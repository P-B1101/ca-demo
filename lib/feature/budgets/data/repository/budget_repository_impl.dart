import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../repository_manager/repository_manager.dart';
import '../../domain/entity/budget.dart';
import '../../domain/entity/budget_category.dart';
import '../../domain/repository/budget_repository.dart';
import '../data_source/budget_data_source.dart';
import '../model/budget_category_model.dart';

@LazySingleton(as: BudgetRepository)
class BudgetRepositoryImpl implements BudgetRepository {
  final RepositoryHelper repositoryHelper;
  final BudgetDataSource dataSource;

  const BudgetRepositoryImpl({
    required this.dataSource,
    required this.repositoryHelper,
  });

  @override
  Future<Either<Failure, void>> addNewCategory(BudgetCategory category) =>
      repositoryHelper.tryToAuthLoad((token) => dataSource.addNewBudgetCategory(
            token: token,
            category: BudgetCategoryModel.fromEntity(category),
          ));

  @override
  Future<Either<Failure, Budget>> getBudget() => repositoryHelper
      .tryToAuthLoad((token) => dataSource.getBudget(token: token));
}
