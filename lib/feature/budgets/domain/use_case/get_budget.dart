import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/budget.dart';
import '../repository/budget_repository.dart';

@lazySingleton
final class GetBudget extends UseCase<Budget, NoParams> {
  final BudgetRepository repository;
  const GetBudget({
    required this.repository,
  });

  @override
  Future<Either<Failure, Budget>> call(NoParams param) =>
      repository.getBudget();
}
