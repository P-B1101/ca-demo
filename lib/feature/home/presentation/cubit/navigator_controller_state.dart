part of 'navigator_controller_cubit.dart';

class NavigatorControllerState extends Equatable {
  final AppTab selectedTab;
  final List<NavigatorItem> mainList;
  const NavigatorControllerState({
    required this.selectedTab,
    required this.mainList,
  });

  @override
  List<Object> get props => [selectedTab];

  NavigatorControllerState copyWith({
    AppTab? selectedTab,
    List<NavigatorItem>? mainList,
  }) =>
      NavigatorControllerState(
        selectedTab: selectedTab ?? this.selectedTab,
        mainList: mainList ?? this.mainList,
      );

  bool get isHome => selectedTab == AppTab.dashboard;
}
