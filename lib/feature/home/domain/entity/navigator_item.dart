import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class NavigatorItem extends Equatable {
  final AppTab tab;
  
  const NavigatorItem({
    required this.tab,
  });

  @override
  List<Object?> get props => [tab];
}