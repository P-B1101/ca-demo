import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/budget_category.dart';
import '../repository/budget_repository.dart';

@lazySingleton
final class AddNewBudgetCategory extends UseCase<void, Params> {
  final BudgetRepository repository;
  const AddNewBudgetCategory({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(Params param) =>
      repository.addNewCategory(param.category);
}

class Params extends NoParams {
  final BudgetCategory category;
  const Params({
    required this.category,
  });

  @override
  List<Object?> get props => [category];
}