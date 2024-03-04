import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entity/budget.dart';
import '../../domain/entity/budget_category.dart';
import '../../domain/use_case/add_new_budget_category.dart';
import '../../domain/use_case/get_budget.dart';

part 'budget_event.dart';
part 'budget_state.dart';

@injectable
class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final AddNewBudgetCategory _addNewBudgetCategory;
  final GetBudget _getBudget;
  BudgetBloc(
    this._addNewBudgetCategory,
    this._getBudget,
  ) : super(BudgetInitial()) {
    on<GetBudgetEvent>(_onGetBudgetEvent, transformer: restartable());
    on<AddNewBudgetCategoryEvent>(
      _onAddNewBudgetCategoryEvent,
      transformer: droppable(),
    );
  }

  Future<void> _onGetBudgetEvent(
    GetBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    emit(BudgetLoadingState(budget: state.budget));
    final newState = await _getBudgetInfo();
    emit(newState);
  }

  Future<void> _onAddNewBudgetCategoryEvent(
    AddNewBudgetCategoryEvent event,
    Emitter<BudgetState> emit,
  ) async {
    emit(AddBudgetCategoryLoadingState(budget: state.budget));
    final category = BudgetCategory.add(
      color: event.color,
      icon: event.icon,
      name: event.name,
      total: event.total,
    );
    final result = await _addNewBudgetCategory(Params(category: category));
    final newState = await result.fold(
      (failure) async => failure.toState(state.budget),
      (response) async {
        emit(AddBudgetCategorySuccessState(budget: state.budget));
        emit(BudgetLoadingState(budget: state.budget));
        return await _getBudgetInfo();
      },
    );
    emit(newState);
  }

  Future<BudgetState> _getBudgetInfo() async {
    final result = await _getBudget(const NoParams());
    return await result.fold(
      (failure) async => failure.toState(state.budget),
      (budget) async => BudgetSuccessState(budget: budget),
    );
  }
}

extension FailureToState on Failure {
  BudgetState toState(Budget? budget) => switch (this) {
        ServerFailure(message: String message) =>
          BudgetFailureState(budget: budget, message: message),
        AuthenticationFailure() => const BudgetUnAuthorizeFailureState(),
        AccessDeniedFailure() => const BudgetAccessDeniedFailureState(),
        NetworkFailure() => const BudgetNoInternetFailureState(),
        _ => BudgetFailureState(budget: budget),
      };
}
