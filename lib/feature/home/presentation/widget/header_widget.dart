import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/ui_utils.dart';

class HeaderWidget extends StatelessWidget {
  final AppTab tab;
  final Function() onSettingClick;
  const HeaderWidget({
    super.key,
    required this.tab,
    required this.onSettingClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: _settingWidget,
          ),
          Center(child: _titleWidget),
        ],
      ),
    );
  }

  Widget get _settingWidget => Builder(
        builder: (context) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: UiUtils.horizontalPadding * .5,
          ),
          width: 42,
          height: 42,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onSettingClick,
            child: const Center(
              child: Icon(
                Fonts.settings,
                color: MColors.notSelectedTextColor,
              ),
            ),
          ),
        ),
      );

  Widget get _titleWidget => Builder(
        builder: (context) => AnimatedSwitcher(
          duration: UiUtils.duration,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (child, animation) {
            const begin = Alignment(0, -1.5);
            const end = Alignment(0, 0);
            var alignmentTween = Tween<Alignment>(begin: begin, end: end);
            var curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: UiUtils.curve,
            );
            return FadeTransition(
              opacity: animation,
              child: AlignTransition(
                key: ValueKey<Key?>(child.key),
                alignment: alignmentTween.animate(curvedAnimation),
                child: child,
              ),
            );
          },
          child: Text(
            tab.toStringValue(context),
            key: ValueKey(tab),
            textAlign: TextAlign.center,
            style: MTextStyle.titleStyle,
          ),
        ),
      );
}
