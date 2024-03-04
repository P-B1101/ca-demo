import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../domain/entity/navigator_item.dart';
import '../cubit/navigator_controller_cubit.dart';

class MainNavigatorWidget extends StatelessWidget {
  final Function(NavigatorItem item) onItemClick;
  const MainNavigatorWidget({
    super.key,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorControllerCubit, NavigatorControllerState>(
      builder: (context, state) => Row(
        children: List.generate(
          state.mainList.length,
          (index) => Expanded(
            child: _ItemWidget(
              isSelected: state.mainList[index].tab == state.selectedTab,
              item: state.mainList[index],
              onClick: onItemClick,
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final NavigatorItem item;
  final bool isSelected;
  final Function(NavigatorItem item) onClick;
  const _ItemWidget({
    Key? key,
    required this.isSelected,
    required this.item,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: item.tab.getMargin,
      child: AnimatedContainer(
        height: 38,
        width: double.infinity,
        duration: UiUtils.duration,
        curve: UiUtils.curve,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: isSelected ? null : () => onClick(item),
            child: Center(child: _iconWidget),
          ),
        ),
      ),
    );
  }

  Widget get _iconWidget => Builder(
        builder: (context) => AnimatedSwitcher(
          duration: UiUtils.duration,
          switchInCurve: UiUtils.curve,
          switchOutCurve: UiUtils.curve,
          child: SizedBox(
            key: ValueKey(isSelected),
            width: 24,
            height: 24,
            child: Center(
              child: Icon(
                item.tab.toIconData,
                size: 18,
                color: isSelected
                    ? MColors.whiteColor
                    : MColors.notSelectedTextColor,
              ),
            ),
          ),
        ),
      );
}
