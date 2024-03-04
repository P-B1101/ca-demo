part of 'budget_bloc.dart';

sealed class BudgetState extends Equatable {
  final Budget? budget;
  const BudgetState({
    this.budget,
  });

  @override
  List<Object?> get props => [budget];

  bool get isSuccess => switch (this) {
        BudgetSuccessState() || AddBudgetCategorySuccessState() => true,
        _ => false,
      };
}

final class BudgetInitial extends BudgetState {}

final class BudgetLoadingState extends BudgetState {
  const BudgetLoadingState({
    required super.budget,
  });
}

final class AddBudgetCategoryLoadingState extends BudgetState {
  const AddBudgetCategoryLoadingState({
    required super.budget,
  });
}

final class BudgetSuccessState extends BudgetState {
  const BudgetSuccessState({
    required super.budget,
  });
}

final class AddBudgetCategorySuccessState extends BudgetState {
  const AddBudgetCategorySuccessState({
    required super.budget,
  });
}

final class BudgetFailureState extends BudgetState {
  final String? message;
  const BudgetFailureState({
    required super.budget,
    this.message,
  });

  @override
  List<Object?> get props => [budget, message];
}

final class BudgetUnAuthorizeFailureState extends BudgetState {
  const BudgetUnAuthorizeFailureState();
}

final class BudgetAccessDeniedFailureState extends BudgetState {
  const BudgetAccessDeniedFailureState();
}

final class BudgetNoInternetFailureState extends BudgetState {
  const BudgetNoInternetFailureState();
}
