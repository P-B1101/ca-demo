import 'package:auto_route/auto_route.dart';
import 'package:d_demo/core/utils/assets.dart';
import 'package:d_demo/core/utils/extensions.dart';
import 'package:d_demo/core/utils/ui_utils.dart';
import 'package:d_demo/feature/budgets/domain/entity/budget_category.dart';
import 'package:d_demo/feature/budgets/presentation/widget/budget_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom/half_circle_progress.dart';
import '../../../../core/utils/m_logger.dart';
import '../../../language/manager/localizatios.dart';
import '../bloc/budget_bloc.dart';

@RoutePage()
class BudgetsPage extends StatelessWidget {
  static const path = 'budgets';
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashboardPage();
  }
}

class _DashboardPage extends StatefulWidget {
  const _DashboardPage();

  @override
  State<_DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<_DashboardPage> {
  @override
  void initState() {
    super.initState();
    _handleInitState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BudgetBloc, BudgetState>(
          listener: (context, state) => _handleBudgetState(state),
        ),
      ],
      child: BlocBuilder<BudgetBloc, BudgetState>(
        buildWhen: (previous, current) =>
            previous.budget == null || current.budget == null,
        builder: (context, state) => AnimatedSwitcher(
          duration: UiUtils.duration,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: () {
            final isLoading = state is BudgetLoadingState;
            if (isLoading && state.budget == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state.isSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  _chartWidget,
                  const SizedBox(height: 32),
                  _statusWidget,
                  const SizedBox(height: 8),
                  Expanded(child: _categoryListWidget),
                ],
              );
            }
            return const SizedBox();
          }(),
        ),
      ),
    );
  }

  Widget get _chartWidget => BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UiUtils.horizontalPadding,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${state.budget?.getAvailableBudget.toCurrency ?? '-'}',
                    textAlign: TextAlign.center,
                    style: MTextStyle.boldTitleStyle,
                  ),
                  Text(
                    Strings.of(context).budget_info_place_holder.replaceFirst(
                          '\$0',
                          state.budget?.budget?.toCurrency ?? '-',
                        ),
                    textAlign: TextAlign.center,
                    style: MTextStyle.subTitleStyle,
                  ),
                ],
              ),
              HalfCircleProgress(
                items: state.budget?.categories
                        .toProgressItem(state.budget?.budget) ??
                    [],
              ),
            ],
          ),
        ),
      );

  Widget get _statusWidget => BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) => Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: UiUtils.horizontalPadding,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UiUtils.borderRadius),
            border: Border.all(
              width: 1,
              color: MColors.progressBackgroundColor,
            ),
          ),
          child: Text(
            state.budget?.getBudgetStatus.toStringValue(context) ?? '-',
            textAlign: TextAlign.center,
            style: MTextStyle.boldTitleStyle.copyWith(
              color: MColors.textColor,
              fontSize: 14,
            ),
          ),
        ),
      );

  Widget get _categoryListWidget => BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          final items = state.budget?.categories ?? [];
          return ListView.builder(
            itemCount: items.length + 1,
            padding: const EdgeInsets.only(
              top: 4,
              bottom: UiUtils.bottomAppBarHeight * 2,
              left: UiUtils.horizontalPadding,
              right: UiUtils.horizontalPadding,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) => index >= items.length
                ? BudgetCategoryItemWidget.addNewItem(_onAddNewCategory)
                : BudgetCategoryItemWidget.item(
                    state.budget?.categories[index] ?? BudgetCategory.empty(),
                  ),
          );
        },
      );

  void _handleInitState() {
    context.read<BudgetBloc>().add(const GetBudgetEvent());
  }

  void _onAddNewCategory() {
    // TODO: implement _onAddNewCategory
  }

  void _handleBudgetState(BudgetState state) {
    if (state is BudgetFailureState) {
      _showError(state.message);
      return;
    }
    if (state is BudgetUnAuthorizeFailureState) {
      _navigateToLoginPage();
      return;
    }
    if (state is BudgetAccessDeniedFailureState) {
      _showError(Strings.of(context).access_denied_message);
      return;
    }
    if (state is BudgetNoInternetFailureState) {
      _showError(Strings.of(context).internet_error);
      return;
    }
  }

  void _showError(String? message) {
    MLogger.log(message ?? Strings.of(context).general_error);
    // TODO: show error
  }

  void _navigateToLoginPage() {
    // TODO: navigate to login page.
  }
}
