import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entity/navigator_item.dart';

part 'navigator_controller_state.dart';

@injectable
class NavigatorControllerCubit extends Cubit<NavigatorControllerState> {
  NavigatorControllerCubit()
      : super(const NavigatorControllerState(
          selectedTab: AppTab.dashboard,
          mainList: [],
        ));

  void initList({
    required List<NavigatorItem> main,
  }) =>
      emit(state.copyWith(mainList: main));

  void onTabSelected(AppTab tab) => emit(state.copyWith(selectedTab: tab));

  void backToHome() => emit(state.copyWith(selectedTab: AppTab.dashboard));
}
