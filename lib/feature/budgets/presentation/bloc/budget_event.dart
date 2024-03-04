part of 'budget_bloc.dart';

sealed class BudgetEvent extends Equatable {
  const BudgetEvent();

  @override
  List<Object> get props => [];
}

final class GetBudgetEvent extends BudgetEvent {
  const GetBudgetEvent();
}

final class AddNewBudgetCategoryEvent extends BudgetEvent {
  final String name;
  final num total;
  final CategoryColor color;
  final CategoryIcon icon;

  const AddNewBudgetCategoryEvent({
    required this.color,
    required this.icon,
    required this.name,
    required this.total,
  });

  @override
  List<Object> get props => [
        color,
        icon,
        name,
        total,
      ];
}
